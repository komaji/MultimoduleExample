//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/06/20.
//

import SwiftUI
import ListFeature

public struct RootView: View {
    public init() {}
    public var body: some View {
        NavigationView {
            ListView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
