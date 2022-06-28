//
//  ListAPIClient.swift
//  MultiModuleExample
//
//  Created by kojima.t on 2022/06/28.
//

import Foundation

protocol ListAPIClientProtocol {
    func fetchList() -> [String]
}

struct ListAPIClient: ListAPIClientProtocol {
    func fetchList() -> [String] {
        (0..<100).map(String.init)
    }
}
