// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MultiModuleExampleModule",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "MainLibrary", targets: ["Main"]),
        .library(name: "ListFeatureLibrary", targets: ["ListFeature"]),
        .library(name: "DetailFeatureLibrary", targets: ["DetailFeature"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "Main", dependencies: ["ListFeature", "Environment"]),
        .target(name: "ListFeature", dependencies: ["Component", "Entity", "Environment"]),
        .target(name: "DetailFeature", dependencies: ["Component", "Network"]),
        .target(name: "Component"),
        .target(name: "Entity"),
        .target(name: "Network", dependencies: ["Entity"]),
        .target(name: "Environment"),
        .testTarget(name: "EntityTests", dependencies: ["Entity"]),
        .testTarget(name: "NetworkTests", dependencies: ["Network"]),
    ]
)
