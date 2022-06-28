//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/03/23.
//

import SwiftUI
import Component
import Environment

public struct ListView: View {
    public typealias Builder = DetailBuildable & SearchBuildable

    private let builder: Builder

    @ObservedObject private var viewModel: ListViewModel

    public init(builder: Builder, viewModel: ListViewModel) {
        self.builder = builder
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack {
            List(viewModel.items, id: \.self) { i in
                NavigationLink(destination: builder.buildDetail(id: Int(i) ?? 0)) {
                    Text("\(i)")
                }
            }

            NavigationLink(
                destination: builder.buildSearch(),
                label: {
                    Text("Enable to search")
                }
            )
        }
        .navigationTitle("List")
    }
}

struct ListView_Previews: PreviewProvider {
    static private let items = (0..<1).map(String.init)
    static private let viewModel = ListViewModel(items: items)

    static var previews: some View {
        NavigationView {
            ListView(builder: previewBuilder, viewModel: viewModel)
        }
    }
}
