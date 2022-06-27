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
    public typealias Resolver = ListResolver

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

            NavigationLink(
                destination: resolver.resolve(
                    ListDescriptor(items: (0..<100).map(String.init))
                )
            ) {
                Text("Go to list")
            }
        }
        .navigationTitle("Detail")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(resolver: previewResolver, id: 1)
        }
    }
}
