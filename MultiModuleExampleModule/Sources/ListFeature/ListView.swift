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
    struct PreviewResolver: Resolver, DetailResolver, SearchResolver {
        func resolve<T>(_ descriptor: T) -> AnyView {
            switch descriptor {
            case let detail as DetailDescriptor:
                return resolveConcrete(detail)
            case let search as SearchDescriptor:
                return resolveConcrete(search)
            default:
                return AnyView(Text("Unexpected"))
            }
        }

        func resolveConcrete(_ descriptor: DetailDescriptor) -> AnyView {
            AnyView(Color.blue)
        }

        func resolveConcrete(_ descriptor: SearchDescriptor) -> AnyView {
            AnyView(Color.green)
        }
    }

    static private let items = (0..<1).map(String.init)
    static private let viewModel = ListViewModel(items: items)

    static var previews: some View {
        NavigationView {
            ListView(resolver: PreviewResolver(), viewModel: viewModel)
        }
    }
}
