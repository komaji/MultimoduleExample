//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI

public protocol Resolver {
    func resolve<T: Descriptor>(_ descriptor: T) -> AnyView
}

public protocol Descriptor {}
