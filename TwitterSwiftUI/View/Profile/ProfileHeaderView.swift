//
//  ProfileHeaderView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @State var selectedFilter: TweetFilerOptions = .tweets
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack{
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(60)
                .shadow(radius: 10)
            Text(viewModel.user.fullname)
                .font(.system(size:16, weight: .semibold))
                .padding(.top,8)
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your bio goes here")
                .font(.system(size: 14))
                .padding(.top,8)
            
            HStack(spacing: 42){
                
                VStack{
                    Text("\(viewModel.user.stats.followers)")
                        .font(.system(size:16, weight: .bold))
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                VStack{
                    Text("\(viewModel.user.stats.following)")
                        .font(.system(size:16, weight: .bold))
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            ProfileActionButtonView(viewModel: viewModel)
            
            Spacer()
        }
    }

}
