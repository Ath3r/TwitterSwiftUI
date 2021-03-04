//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    
    let message: Message
    
    var body: some View {
        VStack {
            HStack(spacing: 12){

                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width:56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4){
                    
                    Text(message.user.fullname)
                        .font(.system(size: 14,weight: .semibold))
                    
                    Text(message.text)
                        .font(.system(size: 14))
                }
                
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .foregroundColor(.black)
            
            Divider()
        }
    }
}

