//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var messageText: String
    
    var body: some View {
        HStack{
            TextField("Message", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: {
                
            }){
                Text("Send")
            }
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: .constant(""))
    }
}
