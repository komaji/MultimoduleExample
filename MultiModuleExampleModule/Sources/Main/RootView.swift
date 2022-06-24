//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI
import ListFeature
import Environment

public struct RootView: View {
    private let resolver: Resolver

    public init(resolver: Resolver) {
        self.resolver = resolver
    }

    public var body: some View {
        NavigationView {
            ListView(resolver: resolver, items: (0..<100).map(String.init))
        }
    }
}

struct RootView_Previews: PreviewProvider {
    struct PreviewResolver: Resolver {
        func resolve<T>(_ descriptor: T) -> AnyView {
            AnyView(EmptyView())
        }
    }

    static var previews: some View {
        RootView(resolver: PreviewResolver())
    }
}
