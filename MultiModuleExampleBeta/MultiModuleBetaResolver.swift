//
//  MultiModuleBetaResolver.swift
//  MultiModuleExampleBeta
//
//  Created by kojima.t on 2022/06/20.
//

import Environment
import DetailFeature
import ListFeature
import SwiftUI

struct MultiModuleBetaResolver: Resolver {
    func resolve<T>(_ descriptor: T) -> AnyView {
        switch descriptor {
        case let list as ListDescriptor:
            return resolveConcrete(list)
        case let detail as DetailDescriptor:
            return resolveConcrete(detail)
        default:
            assertionFailure("Unexpected descriptor \(type(of: descriptor))")
            return AnyView(EmptyView())
        }
    }
}

extension MultiModuleBetaResolver: ListResolver {
    func resolveConcrete(_ descriptor: ListDescriptor) -> AnyView {
        return AnyView(Color.red)
    }
}

extension MultiModuleBetaResolver: DetailResolver {
    func resolveConcrete(_ descriptor: DetailDescriptor) -> AnyView {
        return AnyView(DetailView(resolver: self, id: descriptor.id))
    }
}
