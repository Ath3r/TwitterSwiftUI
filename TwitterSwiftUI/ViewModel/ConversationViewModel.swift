//
//  ConversationViewModel.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 04/03/21.
//

import SwiftUI

class ConverstaionViewMode: ObservableObject{
    
    private var recentMessagesDictionary = [String: Message]()
    @Published var recentmessages = [Message]()
    
    init(){
        fetchRecentMessages()
    }
    func fetchRecentMessages(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        query.order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { (snapshot, _) in
            guard let changes = snapshot?.documentChanges else {return}
            
            changes.forEach { (change) in
                let messageData = change.document.data()
                let uid = change.document.documentID
                
                COLLECTION_USER.document(uid).getDocument { (snapshot, _) in
                    guard let data = snapshot?.data() else {return}
                    
                    let user = User(dictionary: data)
                    self.recentMessagesDictionary[uid] = Message(user: user, dictornary: messageData)
                    
                    self.recentmessages = Array(self.recentMessagesDictionary.values)
                }
            }
        }
    }
}
