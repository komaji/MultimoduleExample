//
//  SearchView.swift
//  MultiModuleExample
//
//  Created by kojima.t on 2022/06/24.
//

import SwiftUI
import Environment

struct SearchView: View {
    @State private var keyword = ""
    @State private var items: [String]

    private let resolver: Resolver
    private let defaultItems: [String]

    init(resolver: Resolver = MultiModuleResolver(), defaultItems: [String]) {
        self.resolver = resolver
        self.defaultItems = defaultItems
        _items = .init(initialValue: defaultItems)
    }

    var body: some View {
        List(items, id: \.self) { i in
            NavigationLink(
                destination: resolver.resolve(DetailDescriptor(id: Int(i) ?? 0)),
                label: { Text("\(i)") }
            )
        }
        .navigationTitle("Search")
        .searchable(
            text: $keyword,
            placement: .navigationBarDrawer(displayMode: .always)
        )
        .onChange(of: keyword) { text in
            if keyword.isEmpty {
                items = defaultItems
            } else {
                items = defaultItems.filter { $0.contains(text) }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    struct PreviewResolver: Resolver, DetailResolver {
        func resolve<T>(_ descriptor: T) -> AnyView {
            switch descriptor {
            case let detail as DetailDescriptor:
                return resolveConcrete(detail)
            default:
                return AnyView(Text("Unexpected"))
            }
        }

        func resolveConcrete(_ descriptor: DetailDescriptor) -> AnyView {
            AnyView(Color.blue)
        }
    }

    static private let items = (0..<1).map(String.init)

    static var previews: some View {
        NavigationView {
            SearchView(resolver: PreviewResolver(), defaultItems: items)
        }
    }
}
