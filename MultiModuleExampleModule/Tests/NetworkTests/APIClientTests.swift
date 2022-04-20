//
//  File.swift
//  
//
//  Created by kojima.t on 2022/03/23.
//

import XCTest
import Entity
@testable import Network

class APIClientTests: XCTestCase {
    func test_fetchProduct() {
        XCTAssertEqual(APIClient().fetchProduct().name, Product().name)
    }
}
