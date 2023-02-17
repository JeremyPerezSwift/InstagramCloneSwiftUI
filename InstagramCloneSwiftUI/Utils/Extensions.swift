//
//  Extensions.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 20/01/2023.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
