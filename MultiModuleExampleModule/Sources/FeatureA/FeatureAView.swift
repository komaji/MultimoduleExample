//
//  SwiftUIView.swift
//  
//
//  Created by kojima.t on 2022/03/23.
//

import SwiftUI
import Component

public struct FeatureAView: View {
    public init() {}
    public var body: some View {
        FeatureView(featureName: "Feature A")
    }
}

struct FeatureAView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureAView()
    }
}
