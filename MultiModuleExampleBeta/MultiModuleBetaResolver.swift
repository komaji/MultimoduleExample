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
        default:
            assertionFailure("Unexpected descriptor \(type(of: descriptor))")
            return AnyView(EmptyView())
        }
    }
}

extension MultiModuleBetaResolver: ListResolver {
    func resolveConcrete(_ descriptor: ListDescriptor) -> AnyView {
        AnyView(Color.red)
    }
}
