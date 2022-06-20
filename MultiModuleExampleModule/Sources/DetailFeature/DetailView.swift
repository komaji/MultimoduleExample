//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/03/23.
//

import SwiftUI
import Component
import Network

public struct DetailView: View {
    private let id: Int
    public init(id: Int) {
        self.id = id
    }
    public var body: some View {
        VStack {
            Text(APIClient().fetchProduct().name + "\(id)")

            Spacer().frame(height: 44.0)

            NavigationLink(destination: DetailView(id: id)) {
                Text("Go to list")
            }
        }
        .navigationTitle("Detail")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(id: 1)
        }
    }
}
