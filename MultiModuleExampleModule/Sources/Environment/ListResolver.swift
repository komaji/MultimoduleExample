//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI

public protocol ListResolver {
    func resolveConcrete(_ descriptor: ListDescriptor) -> AnyView
}

public struct ListDescriptor: Descriptor {
    public init() {}
}
