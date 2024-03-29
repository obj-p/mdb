// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "mdb",
  platforms: [.macOS(.v13)],
  products: [
    .executable(name: "mdb", targets: ["mdb"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0")
  ],
  targets: [
    .executableTarget(
      name: "mdb",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser")
      ]
    ),
    .testTarget(name: "mdbTests", dependencies: ["mdb"]),
  ]
)
