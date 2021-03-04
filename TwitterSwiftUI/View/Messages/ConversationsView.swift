//
//  ConversationsView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct ConversationsView: View {
    
    @State var isShowingNewMessageView = false
    @State var showChat = false
    @State var user: User?
    @ObservedObject var viewModel = ConverstaionViewMode()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            if let user = user{
                NavigationLink(
                                destination: LazyView(ChatView(user: user)),
                    isActive: $showChat,
                    label:{})
            }
            
            ScrollView(){
                
                VStack(){
                    ForEach(viewModel.recentmessages) { recentMessage in
                       NavigationLink(
                        destination: LazyView(ChatView(user: recentMessage.user)),
                            label: {
                                ConversationCell(message: recentMessage)
                            })
                        
                        
                    }
                }
            }
            
            Button(action: {
                self.isShowingNewMessageView.toggle()
            }) {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $isShowingNewMessageView) {
                NewMessageView(startChat: $showChat, show: $isShowingNewMessageView, user: $user)
            }
            
        }
        
    }
}
