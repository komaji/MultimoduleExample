//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/03/23.
//

import SwiftUI
import Component
import Environment

public struct ListView: View {
    private let resolver: Resolver

    public init(resolver: Resolver) {
        self.resolver = resolver
    }

    public var body: some View {
        List(1..<100) { i in
            NavigationLink(destination: resolver.resolve(DetailDescriptor(id: i))) {
                Text("\(i)")
            }
        }
        .navigationTitle("List")
    }
}

struct ListView_Previews: PreviewProvider {
    struct PreviewResolver: Resolver, DetailResolver {
        func resolve<T>(_ descriptor: T) -> AnyView {
            if let descriptor = descriptor as? DetailDescriptor {
                return resolveConcrete(descriptor)
            } else {
                return AnyView(Text("Unexpected"))
            }
        }

        func resolveConcrete(_ descriptor: DetailDescriptor) -> AnyView {
            return AnyView(Color.blue)
        }
    }

    static var previews: some View {
        NavigationView {
            ListView(resolver: PreviewResolver())
        }
    }
}
