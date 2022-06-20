//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/03/23.
//

import SwiftUI
import Component
import Network
import Environment

public struct DetailView: View {
    private let resolver: Resolver
    private let id: Int

    public init(resolver: Resolver, id: Int) {
        self.resolver = resolver
        self.id = id
    }

    public var body: some View {
        VStack {
            Text(APIClient().fetchProduct().name + "\(id)")

            Spacer().frame(height: 44.0)

            NavigationLink(destination: resolver.resolve(ListDescriptor())) {
                Text("Go to list")
            }
        }
        .navigationTitle("Detail")
    }
}

struct DetailView_Previews: PreviewProvider {
    struct PreviewResolver: Resolver, ListResolver {
        func resolve<T>(_ descriptor: T) -> AnyView {
            if let descriptor = descriptor as? ListDescriptor {
                return resolveConcrete(descriptor)
            } else {
                return AnyView(Text("Unexpected"))
            }
        }

        func resolveConcrete(_ descriptor: ListDescriptor) -> AnyView {
            return AnyView(Color.green)
        }
    }

    static var previews: some View {
        NavigationView {
            DetailView(resolver: PreviewResolver(), id: 1)
        }
    }
}
