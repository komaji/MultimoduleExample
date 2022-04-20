//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/03/23.
//

import SwiftUI
import Component
import Network

public struct FeatureBView: View {
    public init() {}
    public var body: some View {
        VStack {
            FeatureView(featureName: "Feature B")

            Text(APIClient().fetchProduct().name)
        }
    }
}

struct FeatureBView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureBView()
    }
}
