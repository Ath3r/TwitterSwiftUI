//
//  LazyView.swift
//  TwitterSwiftUI
//
//  Created by Ather Hussain on 03/03/21.
//

import SwiftUI

struct LazyView<Content: View>: View{
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content){
        self.build = build
    }
    var body: Content{
        build()
    }
}
