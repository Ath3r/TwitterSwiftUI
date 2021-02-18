//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI

struct NewTweetView: View {
    
    @Binding var isPresented: Bool
    @State var captionArea: String = ""
    var body: some View {
        NavigationView{
            VStack{
                HStack(alignment: .top){
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                    
                    TextArea("So, What's popping?", text: $captionArea)
                    
                    Spacer()
                    
                }
                .padding()
                .navigationBarItems(leading: Button(action: {
                    self.isPresented.toggle()
                }){
                    Text("Cancel")
                        .foregroundColor(.blue)
                }, trailing: Button(action: {
                    //Make a tweet
                    self.isPresented.toggle()
                }){
                    Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                })
                Spacer()
            }
            
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(true))
    }
}
