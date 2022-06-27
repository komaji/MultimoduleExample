//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI
import Environment

public struct RootView: View {
    public typealias Builder = ListBuildable

    private let builder: Builder

    public init(builder: Builder) {
        self.builder = builder
    }

    public var body: some View {
        NavigationView {
            builder.buildList(items: (0..<100).map(String.init))
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(builder: previewBuilder)
    }
}
