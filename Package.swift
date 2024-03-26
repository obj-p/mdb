// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "mdb",
    products: [
        .library(name: "mdb", targets: ["mdb"]),
    ],
    targets: [
        .target(name: "mdb"),
        .testTarget(name: "mdbTests", dependencies: ["mdb"]),
    ]
)
