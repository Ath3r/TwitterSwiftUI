//
//  ChatViewModel.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 04/03/21.
//

import SwiftUI
import Firebase



class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    let user: User
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    func fetchMessages(){
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        let query = COLLECTION_MESSAGES.document(uid).collection(user.id)
        
        query.addSnapshotListener { (snapshot, _) in
            guard let changes = snapshot?.documentChanges.filter({$0.type == .added}) else {return}
            
            changes.forEach { (change) in
                let messageData = change.document.data()
                guard let fromId = messageData["fromId"] as? String else {return}
                COLLECTION_USER.document(fromId).getDocument { (snapshot, _) in
                    guard let data = snapshot?.data() else {return}
                    let user = User(dictionary: data)
                    self.messages.append(Message(user: user, dictornary: messageData))
                    self.messages.sort(by: { $0.timestamp.dateValue() < $1.timestamp.dateValue()})
                }
            }
        }
        print(self.messages)
    }
    func sendMessage(_ messageText: String){
        guard let currentUid = AuthViewModel.shared.userSession?.uid else {return}
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let receivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        let messageId = currentUserRef.documentID
        
        let data: [String : Any] = [
            "text": messageText,
            "id": messageId,
            "fromId":currentUid,
            "toId": user.id,
            "timestamp": Timestamp(date: Date())
        ]
        currentUserRef.setData(data)
        receivingUserRef.document(messageId).setData(data)
        receivingRecentRef.document(currentUid).setData(data)
        currentRecentRef.document(user.id).setData(data)
        
    }
}
