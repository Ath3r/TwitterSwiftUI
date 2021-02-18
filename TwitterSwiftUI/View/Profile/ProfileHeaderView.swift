//
//  ProfileHeaderView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack{
            Image("batman")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(60)
                .shadow(radius: 10)
            Text("Bruce Wayne")
                .font(.system(size:16, weight: .semibold))
                .padding(.top,8)
            
            Text("@batman")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your bio goes here")
                .font(.system(size: 14))
                .padding(.top,8)
            
            HStack(spacing: 42){
                
                VStack{
                    Text("1")
                        .font(.system(size:16, weight: .bold))
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                VStack{
                    Text("1")
                        .font(.system(size:16, weight: .bold))
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            ProfileActionButtonView(isCurrnetUser: false)
            Spacer()
            
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
