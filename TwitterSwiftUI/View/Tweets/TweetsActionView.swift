//
//  TweetsActionView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 03/03/21.
//

import SwiftUI

struct TweetsActionView: View {
    
    let tweet: Tweet
    @ObservedObject var viewModel: TweetActionViewModel
    init(tweet: Tweet){
        self.tweet = tweet
        self.viewModel = TweetActionViewModel(tweet: self.tweet)
    }
    
    var body: some View {
        HStack{
            Button(action: {
            }) {
                
                Image(systemName: "bubble.left")
                    .foregroundColor(.gray)
                    .frame(width: 32 ,height: 32 )
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
                
                Image(systemName: "arrow.2.squarepath")
                    .foregroundColor(.gray)
                    .frame(width: 32 ,height: 32 )
            }
            
            Spacer()
            
            
            Button(action: {
                viewModel.didLike ? viewModel.unlikeTweet(): viewModel.likeTweet()
            }) {
                
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .foregroundColor(viewModel.didLike ? .red : .gray)
                    .frame(width: 32 ,height: 32 )
            }
            
            Spacer()
            
            
            Button(action: {
                
            }) {
                
                Image(systemName: "bookmark")
                    .foregroundColor(.gray)
                    .frame(width: 32 ,height: 32 )
            }
            
            
        }
    }
}

