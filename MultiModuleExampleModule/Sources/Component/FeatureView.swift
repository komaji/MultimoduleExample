//
//  File.swift
//  
//
//  Created by kojima.t on 2022/03/23.
//

import SwiftUI

public struct FeatureView: View {
    let featureName: String

    public init(featureName: String) {
        self.featureName = featureName
    }

    public var body: some View {
        Text(featureName)
    }
}

struct FeatureView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureView(featureName: "Feature Name")
    }
}
