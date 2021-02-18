//
//  ChatView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct ChatView: View {
    
    @State var messageText: String = ""
    
    var body: some View {
        
        VStack{
            ScrollView{
                ForEach(MOCK_MESSAGES) {message in
                    MessageView(message: message)
                    
                }
            }
            .padding(.top) 
            MessageInputView(messageText: $messageText)
                .padding()
        }        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}


