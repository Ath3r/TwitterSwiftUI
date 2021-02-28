//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                NavigationView {
                    
                    TabView{
                        FeedView()
                            .tabItem{
                                Image(systemName: "house")
                                Text("Home")
                            }
                        
                        SearchView()
                            .tabItem{
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        
                        ConversationsView()
                            .tabItem{
                                Image(systemName: "envelope")
                                Text("Messages")
                            }
                    }
                    
                    .navigationBarTitle("Home", displayMode: .inline)
                                
                }
            } else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
