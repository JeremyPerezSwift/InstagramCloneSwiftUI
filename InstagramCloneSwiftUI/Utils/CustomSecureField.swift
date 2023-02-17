//
//  CustomSecureField.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 17/02/2023.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 20) {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.16)
        .background(Color(.init(white: 1, alpha: 0.15)))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(text: .constant(""), placeholder: Text("Password"))
    }
}
