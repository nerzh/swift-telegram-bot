// swift-tools-version:6.1

import PackageDescription

let name: String = "SwiftTelegramBot"

let package = Package(
    name: name,
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: name,
            targets: [name]),
    ],
    dependencies: [
        .package(url: "https://github.com/nerzh/swift-regular-expression", .upToNextMajor(from: "0.2.4")),
        .package(url: "https://github.com/nerzh/swift-custom-logger", .upToNextMajor(from: "1.1.0")),
    ],
    targets: [
        .target(
            name: name,
            dependencies: [
                .product(name: "SwiftRegularExpression", package: "swift-regular-expression"),
                .product(name: "SwiftCustomLogger", package: "swift-custom-logger"),
            ]
        ),
        .testTarget(
            name: "\(name)Tests", dependencies: [.init(stringLiteral: name), "SwiftCustomLogger"]
        ),
    ]
)
