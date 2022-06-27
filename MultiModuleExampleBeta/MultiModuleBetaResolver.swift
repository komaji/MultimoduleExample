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

struct MultiModuleBetaResolver {}

extension MultiModuleBetaResolver: ListResolver {
    func resolveList(items: [String]) -> AnyView {
        AnyView(Color.red)
    }
}
