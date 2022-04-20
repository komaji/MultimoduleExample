//
//  MultiModuleExampleApp.swift
//  MultiModuleExample
//
//  Created by kojima.t on 2022/03/23.
//

import SwiftUI
import FeatureA
import FeatureB

@main
struct MultiModuleExampleApp: App {
    var body: some Scene {
        WindowGroup {
            if Int.random(in: 1...10) % 2 == 0 {
                FeatureAView()
            } else {
                FeatureBView()
            }
        }
    }
}
