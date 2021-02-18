//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var selectedFilter: TweetFilerOptions = .tweets
    
    var body: some View {
        ScrollView{
            VStack {
                ProfileHeaderView()
                    .padding()
                
                FilterButtonView(option: $selectedFilter)
                
                ForEach(0..<9) { _ in
                    TweetCell()
                }
            }
        }
        .navigationTitle("Batman")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
