//
//  EditProfilView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 10/03/2023.
//

import SwiftUI

struct EditProfilView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    @Environment(\.dismiss) var dismiss
    @State var bioText = ""
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()

                Button {
                    viewModel.saveUserData(bioText) { isBool in
                        if isBool {
                            self.dismiss()
                        }
                    }
                } label: {
                    Text("Done")
                        .bold()
                }
            }
            
            TextAreaView(text: $bioText, placeholder: "Add your bio...")
                .frame(width: UIScreen.main.bounds.width / 1.05, height: 300)
            
            Spacer()
            
        }
        .padding()
        .onAppear {
            if viewModel.user.bio != nil {
                guard let bio = viewModel.user.bio else { return }
                bioText = bio
            }
        }
    }
}

