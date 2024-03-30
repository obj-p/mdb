// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "mdb",
    platforms: [.macOS(.v13)],
    products: [
        .executable(name: "mdb", targets: ["mdb"]),
        .library(name: "CompanionClient", targets: ["CompanionClient"]),
        .library(name: "CompanionServer", targets: ["CompanionServer"]),
        .library(name: "MDBServer", targets: ["MDBServer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
        .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.2.1"),
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.3.2"),
        .package(url: "https://github.com/swift-server/swift-openapi-async-http-client", from: "1.0.0"),
        .package(url: "https://github.com/swift-server/swift-openapi-vapor", from: "1.0.0"),
        .package(url: "https://github.com/vapor/vapor", from: "4.92.5"),
    ],
    targets: [
        .executableTarget(
            name: "mdb",
            dependencies: [
                "MDBServer",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-async-http-client"),
            ]
        ),
        .testTarget(name: "mdbTests", dependencies: ["mdb"]),
        .target(
            name: "CompanionClient",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
            ],
            path: "Sources/CompanionAPI",
            exclude: ["Server"],
            resources: [.copy("openapi.yaml"), .copy("Client/openapi-generator-config.yaml")],
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            ]
        ),
        .target(
            name: "CompanionServer",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
            ],
            path: "Sources/CompanionAPI",
            exclude: ["Client"],
            resources: [.copy("openapi.yaml"), .copy("Server/openapi-generator-config.yaml")],
            plugins: [
                .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            ]
        ),
        .testTarget(name: "CompanionAPITests", dependencies: ["CompanionClient", "CompanionServer"]),
        .target(
            name: "MDBServer",
            dependencies: [
                "CompanionServer",
                .product(name: "OpenAPIVapor", package: "swift-openapi-vapor"),
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
        .testTarget(name: "MDBServerTests", dependencies: ["MDBServer"]),
    ]
)
