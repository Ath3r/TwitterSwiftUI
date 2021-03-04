//
//  NewMessageView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct NewMessageView: View {
    
    
    @State var searchText: String = ""
    @Binding var startChat: Bool
    @Binding var show: Bool
    @Binding var user: User?
    @ObservedObject var viewModel = SearchViewModel(config: .newMessage)

    
    var body: some View {
        
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading){
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)) {  user in
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                        self.user = user
                    }, label: {
                        UserCell(user: user)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                            .foregroundColor(.black)
                    })
                }
                .padding(.leading)
            }
            
        }
    }
}
