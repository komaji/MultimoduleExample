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
    public typealias Resolver = DetailResolver & SearchResolver

    private let resolver: Resolver

    @ObservedObject private var viewModel: ListViewModel

    public init(resolver: Resolver, viewModel: ListViewModel) {
        self.resolver = resolver
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack {
            List(viewModel.items, id: \.self) { i in
                NavigationLink(destination: resolver.resolve(DetailDescriptor(id: Int(i) ?? 0))) {
                    Text("\(i)")
                }
            }

            NavigationLink(
                destination: resolver.resolve(SearchDescriptor(defaultItems: viewModel.items)),
                label: {
                    Text("Enable to search")
                }
            )
        }
        .navigationTitle("List")
    }
}

struct ListView_Previews: PreviewProvider {
    static private let items = (0..<1).map(String.init)
    static private let viewModel = ListViewModel(items: items)

    static var previews: some View {
        NavigationView {
            ListView(resolver: previewResolver, viewModel: viewModel)
        }
    }
}
