// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ListKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ListKit",
            targets: ["ListKit"]),
    ],
    targets: [
        .target(
            name: "ListKit")
    ]
)
