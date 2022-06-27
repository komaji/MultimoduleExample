//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI

public protocol ListResolver {
    func resolveList(items: [String]) -> AnyView
}
