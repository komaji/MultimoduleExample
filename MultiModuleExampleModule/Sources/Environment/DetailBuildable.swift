//
//  File.swift
//  
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI

public protocol DetailBuildable {
    func buildDetail(id: Int) -> AnyView
}
