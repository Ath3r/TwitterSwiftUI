//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText: String = ""
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    
    
    var body: some View {
        
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading){
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)) {  user in
                    
                    NavigationLink(
                        destination: LazyView(UserProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                        })
                    
                }
                .foregroundColor(.black)
                .padding(.leading)
            }
            
        }
    }
}
