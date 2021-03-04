//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import Firebase

struct Message: Identifiable{
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let id: String
    let timestamp: Timestamp
    
    var chatPartnerId: String {return isFromCurrentUser ? toId  : fromId}
    
    init(user:User, dictornary: [String: Any]) {
        self.user = user
        
        self.text = dictornary["text"] as? String ?? ""
        self.toId = dictornary["toId"] as? String ?? ""
        self.fromId = dictornary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictornary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictornary["id"] as? String ?? ""
    }
    
}
