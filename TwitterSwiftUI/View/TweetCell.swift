//
//  TweetCell.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 12){
                Image("batman")
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text("Batman")
                            .font(.system(size:14, weight: .semibold))
                        Text("@batman")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        Text("It's not who I am underneath, but What I do that defines me")
                    }
                }
                
            }
            .padding(.horizontal)
            
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
                    
                }) {
                    
                    Image(systemName: "heart")
                        .foregroundColor(.gray)
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
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            Divider()
        }
        .padding(.top)
        
        
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
