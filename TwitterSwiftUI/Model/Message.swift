//
//  Message.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import Foundation

struct MockMessage: Identifiable{
    let id: UUID
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}


let MOCK_MESSAGES: [MockMessage] = [
    MockMessage(id: UUID(), imageName: "batman", messageText: "Hey Bro", isCurrentUser: true),
    MockMessage(id: UUID(), imageName: "spiderman", messageText: "Hey Bro", isCurrentUser: false),
    MockMessage(id: UUID(), imageName: "batman", messageText: "How are you?", isCurrentUser: true),
    MockMessage(id: UUID(), imageName: "spiderman", messageText: "Fine bro", isCurrentUser: false),
    MockMessage(id: UUID(), imageName: "spiderman", messageText: "How are you doing bro?", isCurrentUser: false)]
