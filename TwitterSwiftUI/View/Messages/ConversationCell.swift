//
//  ConversationCell.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12){

                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width:56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4){
                    
                    Text("Batman")
                        .font(.system(size: 14,weight: .semibold))
                    
                    Text("Longer messages text to see what happens when I do this")
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

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
