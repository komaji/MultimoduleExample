//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/27.
//

import Foundation

public class ListViewModel: ObservableObject {
    let items: [String]

    public init(items: [String]) {
        self.items = items
    }
}
