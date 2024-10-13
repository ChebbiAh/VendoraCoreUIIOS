// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreUI",
    platforms: [
        .iOS(.v18) // Set minimum iOS version here
    ],
    products: [
        .library(
            name: "CoreUI",
            targets: ["CoreUI"])
    ],
    targets: [
        .target(
            name: "CoreUI"
        ),
        .testTarget(
            name: "CoreUITests",
            dependencies: ["CoreUI"]),
    ]
)
