//
//  TweetActionViewModel.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 03/03/21.
//

import SwiftUI
import Firebase

class TweetActionViewModel: ObservableObject {
    
    @Published var didLike = false
    let tweet: Tweet
    
    init(tweet: Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        let tweetRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USER.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes + 1]){ _ in
            tweetRef.document(uid).setData([ : ]) { (_) in
                userLikesRef.document(self.tweet.id).setData([ : ]) { (_) in
                    self.didLike = true
                }
            }
            
        }
    }
    func unlikeTweet(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        let tweetRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
        let userLikesRef = COLLECTION_USER.document(uid).collection("user-likes")
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes - 1]){ _ in
            tweetRef.document(uid).delete { (_) in
                userLikesRef.document(self.tweet.id).delete { (_) in
                    self.didLike = false
                }
            }
            
        }
    }
    
    func checkIfUserLikedTweet(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        let userLikesRef = COLLECTION_USER.document(uid).collection("user-likes").document(tweet.id)
        userLikesRef.getDocument { (snapshot, _) in
            guard let didLike = snapshot?.exists else {return}
            self.didLike = didLike
        }
    }
}
