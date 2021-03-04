//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct FeedView: View {
    
    @State var isShowingNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            ScrollView(){
                
                LazyVStack{
                    ForEach(viewModel.tweets) { tweet in
                        NavigationLink(
                            destination: TweetDetailView(tweet: tweet)){
                            TweetCell(tweet: tweet)
                        }
                        
                    }
                }
            }
            
            Button(action: {
                self.isShowingNewTweetView.toggle()
            }) {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .clipShape(Circle())
                    .padding()
            }
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                NewTweetView(isPresented: $isShowingNewTweetView)
            }
            
            
        }
    }
}
