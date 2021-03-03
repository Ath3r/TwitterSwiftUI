//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 18/02/21.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @Binding var isPresented: Bool
    @State var captionArea: String = ""
    @ObservedObject var viewModel: UploadTweetViewModel
    
    init(isPresented: Binding<Bool>){
        self._isPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack(alignment: .top){
                    if let user = AuthViewModel.shared.user{
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    }
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
                    viewModel.uploadTweet(caption: captionArea)
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
