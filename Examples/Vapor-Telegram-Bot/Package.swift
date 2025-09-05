// swift-tools-version:6.0

import PackageDescription

var packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.57.0")),
]

var targetDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "Vapor", package: "vapor"),
]

packageDependencies.append(.package(url: "https://github.com/nerzh/swift-telegram-bot", .upToNextMajor(from: "4.0.3")))
targetDependencies.append(.product(name: "SwiftTelegramBot", package: "swift-telegram-bot"))

//packageDependencies.append(.package(path: "/Users/nerzh/mydata/swift_projects/SwiftTelegramSdk"))
//targetDependencies.append(.product(name: "SwiftTelegramSdk", package: "SwiftTelegramSdk"))

let package = Package(
    name: "Vapor-Telegram-Bot",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "Vapor-Telegram-Bot",
            dependencies: targetDependencies
        )
    ]
)
