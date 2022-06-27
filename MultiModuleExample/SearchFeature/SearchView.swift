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
    static private let items = (0..<100).map(String.init)
    static private let viewModel = SearchViewModel(defaultItems: items)

    static var previews: some View {
        NavigationView {
            SearchView(resolver: previewResolver, viewModel: viewModel)
        }
    }
}
