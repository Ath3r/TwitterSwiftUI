//
//  MainViews.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 03/03/21.
//

import SwiftUI

struct MainViews: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        TabView(selection: $selectedIndex){
            FeedView()
                .onTapGesture {
                    selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)

            
            SearchView()
                .onTapGesture {
                    selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)

            
            ConversationsView()
                .onTapGesture {
                    selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "envelope")
                    Text("Messages")
                }.tag(2)

        }
    }
}

