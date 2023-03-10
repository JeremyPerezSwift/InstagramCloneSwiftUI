//
//  ResetPasswordView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 17/02/2023.
//

import SwiftUI

struct ResetPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Binding var email: String
    
    var body: some View {
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
                }
                
                
                Button {
                    viewModel.resetPassword(withEmail: email)                } label: {
                    Text("Send Reset Password Link")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width / 1.16, height: 50)
                        .background(Color(.systemPink))
                        .clipShape(Capsule())
                }
                .padding(.top)
                 
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
                .padding(.bottom, 32)

            }
            
        }
        .navigationBarHidden(true)
        .onReceive(viewModel.$didSendPasswordLink) { _ in
            dismiss()
        }
    }
}

