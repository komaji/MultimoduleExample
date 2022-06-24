//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/24.
//

import SwiftUI

public protocol SearchResolver {
    func resolveConcrete(_ descriptor: SearchDescriptor) -> AnyView
}

public struct SearchDescriptor: Descriptor {
    public let defaultItems: [String]
    public init(defaultItems: [String]) {
        self.defaultItems = defaultItems
    }
}