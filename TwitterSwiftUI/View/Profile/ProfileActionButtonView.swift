//
//  ProfileActionButtonView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    let isCurrnetUser: Bool
    
    var body: some View {
        
        
        if isCurrnetUser{
            
            
            Button(action: {
                
            }){
                Text("Edit Profile")
                    .frame(width: 360, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
        }else{
            
            HStack(spacing: 10){
                
                Button(action: {
                    
                }){
                    Text("Follow")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                Button(action: {
                    
                }){
                    Text("Mesage")
                        .frame(width: 180, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            
        }
        
        
    }
}

struct ProfileActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileActionButtonView(isCurrnetUser: false)
    }
}
