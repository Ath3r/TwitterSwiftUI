//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 19/02/21.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var fullname: String = ""
    @State var username: String = ""
    @State var selectedImage: UIImage?
    @State var image: Image?
    @State var imagePickerShown = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1131996438, green: 0.631419003, blue: 0.9528219104, alpha: 1)).ignoresSafeArea()
            VStack{
                
                
                
                Button(action:{
                    self.imagePickerShown.toggle()
                }) {
                    ZStack {
                        
                        if let image = self.image{
                            image
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .clipShape(Circle())
                                .frame(width: 120, height: 120)
                                .padding(.top, 44)
                                .padding(.bottom, 12)
                        }else{
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .padding(.top, 44)
                                .padding(.bottom, 12)
                                
                        }
                    }
                }
                .sheet(isPresented: $imagePickerShown,onDismiss: loadImage ){
                    ImagePicker(image: $selectedImage)
                }
                
                VStack(spacing: 20){
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"),imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $email, placeholder: Text("Email"),imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    
                    CustomTextField(text: $username, placeholder: Text("Username"),imageName: "person.circle")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal,32)
                
                Button(action:{
                    guard let image = self.selectedImage else { return }
                    viewModel.registerUser(email: self.email, password: self.password, username: self.password, fullname: self.fullname, profileImage: image)
                    
                }){
                    Text("Sign Up")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                }
                Spacer()
                
                Button(action: {
                    mode.wrappedValue.dismiss()
                }) {
                    HStack {
                        
                        Text("Already have an account?")
                            .font(.system(size: 16))
                        
                        Text("Sign In")
                            .font(.system(size: 16, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                }
                
               
                
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
