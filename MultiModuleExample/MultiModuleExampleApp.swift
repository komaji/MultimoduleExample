//
//  MultiModuleExampleApp.swift
//  MultiModuleExample
//
//  Created by kojima.t on 2022/03/23.
//

import SwiftUI
import Main

@main
struct MultiModuleExampleApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(resolver: MultiModuleResolver())
        }
    }
}
