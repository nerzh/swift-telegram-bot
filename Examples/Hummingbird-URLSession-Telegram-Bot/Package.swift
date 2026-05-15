// swift-tools-version:6.1

import PackageDescription

let packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.23.0"),
    .package(url: "https://github.com/swift-server/swift-service-lifecycle.git", .upToNextMajor(from: "2.0.0")),
    .package(path: "../../", traits: [.defaults, "ServiceLifecycle"]),
]

let targetDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "Hummingbird", package: "hummingbird"),
    .product(name: "ServiceLifecycle", package: "swift-service-lifecycle"),
    .product(name: "SwiftTelegramBot", package: "swift-telegram-sdk")
]

let package = Package(
    name: "Hummingbird-URLSession-Telegram-Bot",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "Hummingbird-URLSession-Telegram-Bot",
            dependencies: targetDependencies
        )
    ]
)
