//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI

public protocol ListResolver {
    func resolve(_ descriptor: ListDescriptor) -> AnyView
}

public struct ListDescriptor {
    public let items: [String]
    public init(items: [String]) {
        self.items = items
    }
}
