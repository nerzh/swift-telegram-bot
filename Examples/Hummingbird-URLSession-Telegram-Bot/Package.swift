// swift-tools-version:6.0

import PackageDescription

let packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0-alpha.1"),
    .package(url: "https://github.com/nerzh/swift-telegram-bot.git", .upToNextMajor(from: "4.0.3"))
]

let targetDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "Hummingbird", package: "hummingbird"),
    .product(name: "SwiftTelegramBot", package: "swift-telegram-bot")
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
