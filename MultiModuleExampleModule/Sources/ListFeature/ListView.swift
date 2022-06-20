//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/03/23.
//

import SwiftUI
import Component

public struct ListView: View {
    public init() {}
    public var body: some View {
        List(1..<100) { i in
            NavigationLink(destination: ListView()) {
                Text("\(i)")
            }
        }
        .navigationTitle("List")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
