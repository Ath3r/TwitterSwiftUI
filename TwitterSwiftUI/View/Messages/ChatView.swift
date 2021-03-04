//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct ChatView: View {
    
    let user: User
    @ObservedObject var viewModel: ChatViewModel
    
    @State var messageText: String = ""
    
    init(user:User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        
        VStack{
            ScrollView{
                ForEach(viewModel.messages) {message in
                    MessageView(message: message)
                    
                }
            }
            .padding(.top) 
            MessageInputView(messageText: $messageText, action: sendMessage)
                .padding()
        }
        .navigationTitle(user.username)
    }
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

