// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnyEquatable",
    products: [
        .library(
            name: "AnyEquatable",
            targets: ["AnyEquatable"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AnyEquatable",
            dependencies: ["AnyEquatableRuntime"]),
        .target(
            name: "AnyEquatableRuntime",
            dependencies: ["AnyEquatableRuntimeSwift"]),
        .target(
            name: "AnyEquatableRuntimeSwift",
            dependencies: []),
        .testTarget(
            name: "AnyEquatableTests",
            dependencies: ["AnyEquatable"]),
    ]
)
