// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NetworkLogger",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "NetworkLogger",
            targets: ["NetworkLogger"]
        ),
    ],
    targets: [
        .target(
            name: "NetworkLogger",
            path: "Sources"
        )
    ]
)
