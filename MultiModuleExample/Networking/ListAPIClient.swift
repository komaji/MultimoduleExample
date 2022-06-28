//
//  ListAPIClient.swift
//  MultiModuleExample
//
//  Created by kojima.t on 2022/06/28.
//

import Foundation
import Environment

struct ListAPIClient: ListAPIClientProtocol {
    func fetchList() -> [String] {
        (0..<100).map(String.init)
    }
}
