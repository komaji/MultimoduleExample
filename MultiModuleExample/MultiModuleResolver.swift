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

struct MultiModuleResolver: Resolver {
    func resolve<T>(_ descriptor: T) -> AnyView {
        switch descriptor {
        case let list as ListDescriptor:
            return resolveConcrete(list)
        case let detail as DetailDescriptor:
            return resolveConcrete(detail)
        case let search as SearchDescriptor:
            return resolveConcrete(search)
        default:
            assertionFailure("Unexpected descriptor \(type(of: descriptor))")
            return AnyView(EmptyView())
        }
    }
}

extension MultiModuleResolver: ListResolver {
    func resolveConcrete(_ descriptor: ListDescriptor) -> AnyView {
        let viewModel = ListViewModel(items: descriptor.items)
        return AnyView(ListView(resolver: self, viewModel: viewModel))
    }
}

extension MultiModuleResolver: DetailResolver {
    func resolveConcrete(_ descriptor: DetailDescriptor) -> AnyView {
        AnyView(DetailView(resolver: self, id: descriptor.id))
    }
}

extension MultiModuleResolver: SearchResolver {
    func resolveConcrete(_ descriptor: SearchDescriptor) -> AnyView {
        let viewModel = SearchViewModel(defaultItems: descriptor.defaultItems)
        return AnyView(SearchView(resolver: self, viewModel: viewModel))
    }
}
