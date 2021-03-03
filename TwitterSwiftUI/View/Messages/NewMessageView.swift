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
    @ObservedObject var viewModel = SearchViewModel()

    
    var body: some View {
        
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading){
                ForEach(viewModel.users) {  user in
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
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

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(startChat: .constant(true), show: .constant(true))
    }
}
