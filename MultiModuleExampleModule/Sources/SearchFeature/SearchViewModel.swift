//
//  SearchViewModel.swift
//  MultiModuleExample
//
//  Created by kojima.t on 2022/06/27.
//

import Environment
import SwiftUI

public protocol SearchViewModelProtocol: ObservableObject {
    var keyword: String { get set }
    var items: [String] { get }

    func onChangeKeyword(_ keyword: String)
}

public class SearchViewModel: SearchViewModelProtocol {
    @Published public var keyword = ""
    @Published public private(set) var items: [String]

    private let defaultItems: [String]

    public init(apiClient: ListAPIClientProtocol) {
        self.defaultItems = apiClient.fetchList()
        _items = .init(initialValue: defaultItems)
    }

    public func onChangeKeyword(_ keyword: String) {
        if keyword.isEmpty {
            items = defaultItems
        } else {
            items = defaultItems.filter { $0.contains(keyword) }
        }
    }
}
