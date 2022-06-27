//
//  MultiModuleBetaBuilder.swift
//  MultiModuleExampleBeta
//
//  Created by kojima.t on 2022/06/20.
//

import Environment
import DetailFeature
import ListFeature
import SwiftUI

struct MultiModuleBetaBuilder {}

extension MultiModuleBetaBuilder: ListBuildable {
    func buildList(items: [String]) -> AnyView {
        AnyView(Color.red)
    }
}
