//
//  TextAreaView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 07/03/2023.
//

import SwiftUI

struct TextAreaView: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .font(.system(size: 13))
                .padding(4)
                .background(.clear)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .font(.system(size: 13))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
        }
    }
}
