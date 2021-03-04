//
//  SearchViewModel.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 03/03/21.
//

import Foundation
import SwiftUI
import Firebase


enum SearchViewModelConfig {
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    private let config: SearchViewModelConfig
    
    init(config: SearchViewModelConfig){
        self.config = config
        fetchUsers(forConfig: config)
    }
    func fetchUsers(forConfig config: SearchViewModelConfig)  {
        COLLECTION_USER.getDocuments{ snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            let users = documents.map({User(dictionary: $0.data())})
            
            switch config{
            case .newMessage:
                self.users = users.filter({!$0.isCurrentUser})
            case .search:
                self.users = documents.map({User(dictionary: $0.data())})

            }
            
        }
    }
    func filterUsers(_ query: String) -> [User] {
        let lowerCasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowerCasedQuery) || $0.username.lowercased().contains(lowerCasedQuery) })
    }
}
