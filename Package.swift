// swift-tools-version:6.1

import PackageDescription

let name: String = "SwiftTelegramBot"
let serviceLifecycleTrait = "ServiceLifecycle"

let swiftSettings: [SwiftSetting] = [
    .swiftLanguageMode(.v6),
]

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
    traits: [
        .trait(
            name: serviceLifecycleTrait,
            description: "Adds ServiceLifecycle conformance for TGBot."
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/nerzh/swift-regular-expression", .upToNextMajor(from: "0.2.4")),
        .package(url: "https://github.com/nerzh/swift-custom-logger", .upToNextMajor(from: "1.1.0")),
        .package(url: "https://github.com/swift-server/swift-service-lifecycle.git", .upToNextMajor(from: "2.0.0")),
    ],
    targets: [
        .target(
            name: name,
            dependencies: [
                .product(name: "SwiftRegularExpression", package: "swift-regular-expression"),
                .product(name: "SwiftCustomLogger", package: "swift-custom-logger"),
                .product(
                    name: "ServiceLifecycle",
                    package: "swift-service-lifecycle",
                    condition: .when(traits: [serviceLifecycleTrait])
                ),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "\(name)Tests",
            dependencies: [
                .init(stringLiteral: name),
                .product(name: "SwiftCustomLogger", package: "swift-custom-logger"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
