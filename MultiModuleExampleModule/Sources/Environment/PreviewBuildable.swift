//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/27.
//

import SwiftUI

// 自動生成
public protocol PreviewBuildable: ListBuildable & DetailBuildable & SearchBuildable {}

struct PreviewBuilder: PreviewBuildable {
    func buildList(items: [String]) -> AnyView {
        AnyView(Color.green)
    }

    func buildDetail(id: Int) -> AnyView {
        AnyView(Color.green)
    }

    func buildSearch() -> AnyView {
        AnyView(Color.green)
    }
}

public extension PreviewProvider {
    static var previewBuilder: some PreviewBuildable { PreviewBuilder() }
}
