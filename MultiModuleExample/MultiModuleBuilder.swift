//
//  Environment.swift
//  MultiModuleExample
//
//  Created by kojima.t on 2022/06/20.
//

import Environment
import DetailFeature
import ListFeature
import SwiftUI

struct MultiModuleBuilder {}

extension MultiModuleBuilder: ListBuildable {
    func buildList(items: [String]) -> AnyView {
        let viewModel = ListViewModel(items: items)
        return AnyView(ListView(builder: self, viewModel: viewModel))
    }
}

extension MultiModuleBuilder: DetailBuildable {
    func buildDetail(id: Int) -> AnyView {
        AnyView(DetailView(builder: self, id: id))
    }
}

extension MultiModuleBuilder: SearchBuildable {
    func buildSearch(defaultItems: [String]) -> AnyView {
        let viewModel = SearchViewModel(defaultItems: defaultItems)
        return AnyView(SearchView(builder: self, viewModel: viewModel))
    }
}
