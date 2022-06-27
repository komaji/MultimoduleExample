//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/24.
//

import SwiftUI

public protocol SearchBuildable {
    func buildSearch(defaultItems: [String]) -> AnyView
}
