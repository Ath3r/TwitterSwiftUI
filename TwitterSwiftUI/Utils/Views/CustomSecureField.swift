//
//  CustomSecureField.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 19/02/21.
//

import SwiftUI

struct CustomSecureField: View {
    
    @Binding var text:String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty{
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            HStack{
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("",text: $text)
            }
        }

    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(text: .constant(""), placeholder: Text("Email"))
    }
}
