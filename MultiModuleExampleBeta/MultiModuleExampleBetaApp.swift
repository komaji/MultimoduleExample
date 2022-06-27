//
//  MultiModuleExampleBetaApp.swift
//  MultiModuleExampleBeta
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI
import Main

@main
struct MultiModuleExampleApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(builder: MultiModuleBetaBuilder())
        }
    }
}
