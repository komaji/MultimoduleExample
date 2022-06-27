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

struct MultiModuleResolver {}

extension MultiModuleResolver: ListResolver {
    func resolveList(items: [String]) -> AnyView {
        let viewModel = ListViewModel(items: items)
        return AnyView(ListView(resolver: self, viewModel: viewModel))
    }
}

extension MultiModuleResolver: DetailResolver {
    func resolveDetail(id: Int) -> AnyView {
        AnyView(DetailView(resolver: self, id: id))
    }
}

extension MultiModuleResolver: SearchResolver {
    func resolveSearch(defaultItems: [String]) -> AnyView {
        let viewModel = SearchViewModel(defaultItems: defaultItems)
        return AnyView(SearchView(resolver: self, viewModel: viewModel))
    }
}
