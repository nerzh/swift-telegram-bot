// swift-tools-version:6.0

import PackageDescription

let packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/nerzh/swift-telegram-bot", .upToNextMajor(from: "4.2.0")),
]

let targetDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "SwiftTelegramBot", package: "swift-telegram-bot")
]

let package = Package(
    name: "NoWebServerPingPongBot",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "NoWebServerPingPongBot",
            dependencies: targetDependencies
        )
    ]
)
