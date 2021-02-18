//
//  UserCell.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        
        HStack(spacing: 12){

            Image("batman")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width:56, height: 56)
                .cornerRadius(28)
            
            VStack(alignment: .leading, spacing: 4){
                
                Text("Batman")
                    .font(.system(size: 14,weight: .semibold))
                
                Text("BatmanId")
                    .font(.system(size: 14))
            }
            
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
