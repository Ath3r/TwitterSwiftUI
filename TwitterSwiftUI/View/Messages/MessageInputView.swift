//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var messageText: String
    
    var action: () -> Void
        
    var body: some View {
        HStack{
            TextField("Message", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: action){
                Text("Send")
            }
        }
    }

}


