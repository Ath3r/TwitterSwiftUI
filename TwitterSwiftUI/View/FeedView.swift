//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            ScrollView(){
                
                VStack(){
                    ForEach(0..<100) { _ in
                        TweetCell()
                    }
                }
            }
            
            Button(action: {
                
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
            
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
