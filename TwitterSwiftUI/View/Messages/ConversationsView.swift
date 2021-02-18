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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            NavigationLink(
                destination: ChatView(),
                isActive: $showChat,
                label:{})
            
            ScrollView(){
                
                VStack(){
                    ForEach(0..<1) { _ in
                        
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                ConversationCell()
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
                NewMessageView(startChat: $showChat, show: $isShowingNewMessageView)
            }
            
        }
        
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
