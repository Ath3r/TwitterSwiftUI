//
//  ProfileViewModel.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 03/03/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var userTweets = [Tweet]()
    @Published var likedTweeets = [Tweet]()
    init(user: User){
        self.user = user
        checkIfUserFollowed()
        fetchUserTweets()
        fetchLikedTweets()
        fetchUserStats()
    }
    func tweets(forFilter filter: TweetFilerOptions) -> [Tweet]{
        switch filter{
        case .tweets: return userTweets
        case .likes: return likedTweeets
        //        case .replies: return userTweets
        }
    }
}

// MARK: - API

extension ProfileViewModel{
    func follow(){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
        followingRef.document(self.user.id).setData([:]){ _ in
            followersRef.document(currentUid).setData([:]){ _ in
                self.user.isFollowed = false
            }
        }
    }
    func unfollow(){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        followingRef.document(user.id).delete { _ in
            followersRef.document(currentUid).delete { _ in
                self.user.isFollowed = false
            }
        }
    }
    func checkIfUserFollowed(){
        guard let currentUid = Auth.auth().currentUser?.uid else {return }
        guard !user.isCurrentUser else {return}
        let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
        
        followingRef.document(user.id).getDocument { (snapshot, _) in
            guard let isFollowed = snapshot?.exists else {return}
            self.user.isFollowed = isFollowed
        }
    }
    func fetchUserTweets(){
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else {return}
            
            self.userTweets = documents.map({Tweet(dictionary: $0.data())})
        }
    }
    func fetchLikedTweets(){
        var tweets = [Tweet]()
        COLLECTION_USER.document(user.id).collection("user-likes").getDocuments { (snapshot, _) in
            guard let documents = snapshot?.documents else {return}
            let tweetIds = documents.map({$0.documentID})
            tweetIds.forEach { (id) in
                COLLECTION_TWEETS.document(id).getDocument { (snapshot, _) in
                    guard let data = snapshot?.data() else {return}
                    tweets.append(Tweet(dictionary: data))
                    guard tweets.count == tweetIds.count else {return}
                    self.likedTweeets = tweets
                }
            }
        }
    }
    func fetchUserStats(){
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        let followingRef = COLLECTION_FOLLOWING.document(user.id).collection("user-following")
        followersRef.getDocuments { (snapshot, _) in
            guard let followersCount = snapshot?.documents.count else {return}
            
            followingRef.getDocuments { (snapshot, _) in
                guard let followingCount = snapshot?.documents.count else {return}
                self.user.stats = UserStats(followers: followersCount, following: followingCount)
            }
        
        }
    }
}
