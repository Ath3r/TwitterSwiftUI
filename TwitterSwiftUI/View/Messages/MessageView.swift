//
//  MessageView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let message: Message
    var body: some View {
        HStack {
            
            if message.isFromCurrentUser{
                
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.leading, 100)
                    .padding(.trailing, 16)
            }
            else{
                HStack(alignment: .bottom) {
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    Text(message.text)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                .padding(.horizontal, 4)
                .padding(.trailing, 100)
                .padding(.leading, 16)
                Spacer()       
            }
        }
    }
}

