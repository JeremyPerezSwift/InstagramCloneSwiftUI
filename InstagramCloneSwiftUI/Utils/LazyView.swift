//
//  LazyView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 08/03/2023.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
