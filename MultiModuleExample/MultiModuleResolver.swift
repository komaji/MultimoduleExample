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
    func resolve(_ descriptor: ListDescriptor) -> AnyView {
        let viewModel = ListViewModel(items: descriptor.items)
        return AnyView(ListView(resolver: self, viewModel: viewModel))
    }
}

extension MultiModuleResolver: DetailResolver {
    func resolve(_ descriptor: DetailDescriptor) -> AnyView {
        AnyView(DetailView(resolver: self, id: descriptor.id))
    }
}

extension MultiModuleResolver: SearchResolver {
    func resolve(_ descriptor: SearchDescriptor) -> AnyView {
        let viewModel = SearchViewModel(defaultItems: descriptor.defaultItems)
        return AnyView(SearchView(resolver: self, viewModel: viewModel))
    }
}
