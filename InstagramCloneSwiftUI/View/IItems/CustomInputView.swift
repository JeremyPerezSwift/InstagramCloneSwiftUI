//
//  CustomInputView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 07/03/2023.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            HStack {
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action) {
                    Text("send")
                        .bold()
                        .foregroundColor(.black)
                }

            }
        }
        .padding(.bottom)
        .padding(.horizontal)
    }
}

