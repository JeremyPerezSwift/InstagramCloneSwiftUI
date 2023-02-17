//
//  UserStatView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 21/01/2023.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 13, weight: .semibold))
            
            Text("\(title)")
                .font(.system(size: 13))
        }
        .frame(width: 80, alignment: .center)
    }
}
