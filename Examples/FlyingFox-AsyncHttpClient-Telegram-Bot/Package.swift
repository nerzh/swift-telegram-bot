// swift-tools-version:6.0

import PackageDescription

let packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/swhitty/FlyingFox.git", .upToNextMajor(from: "0.14.0")),
    .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.6.0"),
    .package(url: "https://github.com/nerzh/swift-telegram-bot", .upToNextMajor(from: "4.0.3")),
]

let targetDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "FlyingFox", package: "FlyingFox"),
    .product(name: "AsyncHTTPClient", package: "async-http-client"),
    .product(name: "SwiftTelegramBot", package: "swift-telegram-bot")
]

let package = Package(
    name: "FlyingFox-AsyncHttpClient-Telegram-Bot",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "FlyingFox-AsyncHttpClient-Telegram-Bot",
            dependencies: targetDependencies
        )
    ]
)
