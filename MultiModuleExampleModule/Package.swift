// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MultiModuleExampleModule",
    platforms: [.iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "FeatureALibrary", targets: ["FeatureA"]),
        .library(name: "FeatureBLibrary", targets: ["FeatureB"])
    ],
    dependencies: [
        .package(url: https://, <#T##requirement: Package.Dependency.Requirement##Package.Dependency.Requirement#>)
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "FeatureA", dependencies: ["Component", "Entity"]),
        .target(name: "FeatureB", dependencies: ["Component", "Network"]),
        .target(name: "Component"),
        .target(name: "Entity"),
        .target(name: "Network", dependencies: ["Entity"]),
        .testTarget(name: "EntityTests", dependencies: ["Entity"]),
        .testTarget(name: "NetworkTests", dependencies: ["Network"]),
    ]
)
