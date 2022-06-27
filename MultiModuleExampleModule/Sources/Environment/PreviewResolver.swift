//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/27.
//

import SwiftUI

// 自動生成
public protocol PreviewResolver: ListResolver & DetailResolver & SearchResolver {}

struct PreviewResolverImpl: PreviewResolver {
    func resolveList(items: [String]) -> AnyView {
        AnyView(Color.green)
    }

    func resolveDetail(id: Int) -> AnyView {
        AnyView(Color.green)
    }

    func resolveSearch(defaultItems: [String]) -> AnyView {
        AnyView(Color.green)
    }
}

public extension PreviewProvider {
    static var previewResolver: some PreviewResolver { PreviewResolverImpl() }
}
