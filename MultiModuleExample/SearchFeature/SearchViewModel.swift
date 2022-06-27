//
//  SearchViewModel.swift
//  MultiModuleExample
//
//  Created by kojima.t on 2022/06/27.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var keyword = ""
    @Published private(set) var items: [String]

    private let defaultItems: [String]

    init(defaultItems: [String]) {
        self.defaultItems = defaultItems
        _items = .init(initialValue: defaultItems)
    }

    func onChangeKeyword(_ keyword: String) {
        if keyword.isEmpty {
            items = defaultItems
        } else {
            items = defaultItems.filter { $0.contains(keyword) }
        }
    }
}
