//
//  File.swift
//  
//
//  Created by kojima.t on 2022/03/23.
//

import XCTest
@testable import Entity

class ProductTests: XCTestCase {
    func test_name() {
        XCTAssertEqual(Product().name, "Product")
    }
}
