//
//  SearchView.swift
//  MultiModuleExample
//
//  Created by kojima.t on 2022/06/24.
//

import SwiftUI
import Environment

struct SearchView: View {
    private let resolver: Resolver

    @ObservedObject private var viewModel: SearchViewModel

    init(resolver: Resolver = MultiModuleResolver(), viewModel: SearchViewModel) {
        self.resolver = resolver
        self.viewModel = viewModel
    }

    var body: some View {
        List(viewModel.items, id: \.self) { i in
            NavigationLink(
                destination: resolver.resolve(DetailDescriptor(id: Int(i) ?? 0)),
                label: { Text("\(i)") }
            )
        }
        .navigationTitle("Search")
        .searchable(
            text: $viewModel.keyword,
            placement: .navigationBarDrawer(displayMode: .always)
        )
        .onChange(of: viewModel.keyword, perform: viewModel.onChangeKeyword)
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
    static private let viewModel = SearchViewModel(defaultItems: items)

    static var previews: some View {
        NavigationView {
            SearchView(resolver: PreviewResolver(), viewModel: viewModel)
        }
    }
}
