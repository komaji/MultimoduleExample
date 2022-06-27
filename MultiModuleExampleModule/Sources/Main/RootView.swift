//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI
import Environment

public struct RootView: View {
    public typealias Resolver = ListResolver

    private let resolver: Resolver

    public init(resolver: Resolver) {
        self.resolver = resolver
    }

    public var body: some View {
        NavigationView {
            resolver.resolveList(items: (0..<100).map(String.init))
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(resolver: previewResolver)
    }
}
