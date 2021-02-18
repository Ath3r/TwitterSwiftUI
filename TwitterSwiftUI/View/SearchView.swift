//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading){
                ForEach(0..<10) {  _ in
                    
                    NavigationLink(
                        destination: UserProfileView(),
                        label: {
                            UserCell()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                        })
                    
                }
                .foregroundColor(.black)
                .padding(.leading)
            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
