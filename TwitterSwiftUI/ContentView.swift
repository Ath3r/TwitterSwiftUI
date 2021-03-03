//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                NavigationView {
                    MainViews()
                        .navigationBarTitle("Home", displayMode: .inline)
                        .navigationBarItems(leading: Button(action: {
                            viewModel.signout()
                        }, label: {
                            if let user = viewModel.user {
                                KFImage(URL(string: user.profileImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .frame(width: 32, height: 32)
                                    .cornerRadius(16)
                            }
                        }))
                                
                }
                .navigationViewStyle(StackNavigationViewStyle())
            } else{
                LoginView()
            }
        }
    }
}
