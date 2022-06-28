//
//  SearchView.swift
//  MultiModuleExample
//
//  Created by kojima.t on 2022/06/24.
//

import SwiftUI
import Environment

public struct SearchView<T: SearchViewModelProtocol>: View {
    public typealias Builder = DetailBuildable

    private let builder: Builder

    @ObservedObject private var viewModel: T

    public init(builder: Builder, viewModel: T) {
        self.builder = builder
        self.viewModel = viewModel
    }

    public var body: some View {
        List(viewModel.items, id: \.self) { i in
            NavigationLink(
                destination: builder.buildDetail(id: Int(i) ?? 0),
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
    class ViewModel: SearchViewModelProtocol {
        var keyword: String = ""
        var items: [String] = (0..<100).map(String.init)
        func onChangeKeyword(_ keyword: String) {}
    }

    static private let viewModel = ViewModel()

    static var previews: some View {
        NavigationView {
            SearchView(builder: previewBuilder, viewModel: viewModel)
        }
    }
}
