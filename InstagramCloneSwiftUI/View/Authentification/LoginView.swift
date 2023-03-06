//
//  LoginView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 17/02/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.systemPink), Color(.systemBlue)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Image("Instagram-Logo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 16) {
                        CustomTextfield(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 32)
                        }

                    }
                    
                    Button {
                        viewModel.login(withEmail: email, password: password)
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width / 1.16, height: 50)
                            .background(Color(.systemPink))
                            .clipShape(Capsule())
                    }
                    .padding(.top)
                     
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView()
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                    }
                    .padding(.bottom, 32)

                }
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
