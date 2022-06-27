//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/27.
//

import SwiftUI

public protocol PreviewResolver: ListResolver & DetailResolver & SearchResolver {}

struct PreviewResolverImpl: PreviewResolver {
    func resolve(_ descriptor: ListDescriptor) -> AnyView {
        AnyView(Color.green)
    }

    func resolve(_ descriptor: DetailDescriptor) -> AnyView {
        AnyView(Color.green)
    }

    func resolve(_ descriptor: SearchDescriptor) -> AnyView {
        AnyView(Color.green)
    }
}

public extension PreviewProvider {
    static var previewResolver: some PreviewResolver { PreviewResolverImpl() }
}
