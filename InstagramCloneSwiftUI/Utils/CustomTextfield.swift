//
//  CustomTextfield.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 17/02/2023.
//

import SwiftUI

struct CustomTextfield: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 20) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.16)
        .background(Color(.init(white: 1, alpha: 0.15)))
        .cornerRadius(10)
        .foregroundColor(.white)
//        .padding(.horizontal, 32)
    }
}

struct CustomTextfield_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextfield(text: .constant(""), placeholder: Text("Email"), imageName: "envelope")
    }
}
