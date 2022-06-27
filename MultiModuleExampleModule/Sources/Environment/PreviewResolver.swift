//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/27.
//

import SwiftUI

public extension PreviewProvider {
    static var previewResolver: some Resolver { PreviewResolver() }
}

struct PreviewResolver: Resolver {
    func resolve<T: Descriptor>(_ descriptor: T) -> AnyView {
        AnyView(Color.green)
    }
}
