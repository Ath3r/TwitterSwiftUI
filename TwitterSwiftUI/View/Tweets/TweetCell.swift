//
//  TweetCell.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 12){
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text(tweet.username)
                            .font(.system(size:14, weight: .semibold))
                            .foregroundColor(.black)
                        Text("@\(tweet.username)")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        Text(tweet.caption)
                            .foregroundColor(.black)
                    }
                }
                
            }
            .padding(.horizontal)
            
            TweetsActionView(tweet: tweet)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            Divider()
        }
        .padding(.top)
        
        
    }
}
