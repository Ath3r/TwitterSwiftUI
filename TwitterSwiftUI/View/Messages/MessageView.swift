//
//  MessageView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct MessageView: View {
    let message: MockMessage
    var body: some View {
        HStack {
            
            if message.isCurrentUser{
                
                Spacer()
                
                Text(message.messageText)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            else{
                HStack(alignment: .bottom) {
                    
                    Image(message.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    Text(message.messageText)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                .padding(.horizontal, 4)
                Spacer()       
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: MOCK_MESSAGES[1])
    }
}
