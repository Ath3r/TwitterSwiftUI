//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 19/02/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.1131996438, green: 0.631419003, blue: 0.9528219104, alpha: 1)).ignoresSafeArea()
                VStack{
                    Image("twitter-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .padding(.top, 88)
                        .padding(.bottom, 48)
                    
                    VStack(spacing: 20){
                        CustomTextField(text: $email, placeholder: Text("Email"),imageName: "envelope")
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
                    
                    HStack{
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 8)
                                .padding(.trailing, 32)
                        }
                    }
                    
                    Button(action:{
                    
                        viewModel.login(withEmail: email, password: password)
                        
                    }){
                        Text("Sign In")
                            .foregroundColor(.blue)
                            .font(.headline)
                            .frame(width: 360, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    }
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView()
                            .navigationBarHidden(true),
                        label: {
                            HStack {
                                
                                Text("Don't have an account?")
                                    .font(.system(size: 16))
                                
                                Text("Sign Up")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .padding(.bottom, 40)
                        })
                }
            }
            .navigationBarHidden(true)
    
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
