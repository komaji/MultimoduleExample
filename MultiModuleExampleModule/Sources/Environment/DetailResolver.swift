//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI

public protocol DetailResolver {
    func resolve(_ descriptor: DetailDescriptor) -> AnyView
}

public struct DetailDescriptor {
    public let id: Int
    public init(id: Int) {
        self.id = id
    }
}
