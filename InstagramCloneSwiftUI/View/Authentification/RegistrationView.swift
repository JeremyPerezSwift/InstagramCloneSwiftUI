//
//  RegistrationView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 17/02/2023.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var fullname: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.systemPink), Color(.systemBlue)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Button {
                        imagePickerPresented.toggle()
                    } label: {
                        
                        if let image = postImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .clipShape(Circle())
                        } else {
                            Image("add-button")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .sheet(isPresented: $imagePickerPresented) {
                        loadImage()
                    } content: {
                        ImagePicker(image: $selectedImage)
                    }
                    
                    VStack(spacing: 16) {
                        CustomTextfield(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        
                        CustomTextfield(text: $username, placeholder: Text("Username"), imageName: "person")
                        
                        CustomTextfield(text: $fullname, placeholder: Text("Fullname"), imageName: "person")
                            
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                    }
                    
                    Button {
                        viewModel.register(withEmail: email, password: password)
                    } label: {
                        Text("Sign Up")
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
        }
        .navigationBarHidden(true)
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else  { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
