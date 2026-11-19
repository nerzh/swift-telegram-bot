# Swift Telegram Bot for Telegram Bot Api (SDK for creating Telegram Bots in Swift)

### Please, support with ⭐️

🤖 The wrapper for the Telegram Bot API written in Swift. It's not a framework. There is no special syntax here. This is a library that implements all [Telegram Bot API methods](https://core.telegram.org/bots/api#available-methods), which is available to you to work with Vapor, Smoke, FlyingFox.

#### Swift Server Side Community
[Swift Server Side Community - Ukraine / Russian / CIS Telegram Chat](https://t.me/server_side_swift)

# Swift version

The current source requires Swift 6.2 or later.

# Usage
- Clone one of [examples](https://github.com/nerzh/swift-telegram-sdk/tree/master/Examples)
  ```shell
  git clone https://github.com/nerzh/swift-telegram-bot
  ```
  ```
  cd swift-telegram-bot/Examples/Vapor-Telegram-Bot
  ```
- Add your telegram bot id to [configure.swift](https://github.com/nerzh/swift-telegram-bot/blob/master/Examples/Vapor-Telegram-Bot/Sources/Vapor-Telegram-Bot/configure.swift)
  ```swift
  let botId: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
  ```
- Run in Xcode or build and run binary file
- check commands in your telegram bots
  - /ping
  - /show_buttons
# Examples
- [Vapor Telegram Bot](https://github.com/nerzh/swift-telegram-bot/tree/master/Examples/Vapor-Telegram-Bot)
- [Hummingbird Telegram Bot (AsyncHttpClient)](https://github.com/nerzh/swift-telegram-bot/tree/master/Examples/Hummingbird-AsyncHttpClient-Telegram-Bot)
- [Hummingbird Telegram Bot (URLSession)](https://github.com/nerzh/swift-telegram-bot/tree/master/Examples/Hummingbird-URLSession-Telegram-Bot)
- [Smoke Telegram Bot (AsyncHttpClient)](https://github.com/nerzh/swift-telegram-bot/tree/master/Examples/Smoke-AsyncHttpClient-Telegram-Bot)
- [FlyingFox Telegram Bot (AsyncHttpClient)](https://github.com/nerzh/swift-telegram-bot/tree/master/Examples/FlyingFox-AsyncHttpClient-Telegram-Bot)

## Bot configuration.
### Define bot ID
```swift
import SwiftTelegramBot
import Logging

let tgApi: String = "XXXXXXXXXX:YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
var logger: Logger = .init(label: "swift_telegram_bot")
logger.logLevel = .error
```
### Define connection type
##### LongPolling
```swift
let connectionType: TGConnectionType = .longpolling()
```
##### WebHook
```swift
let connectionType: TGConnectionType = .webhook(webHookURL: URL(string: "\(TG_WEBHOOK_DOMAIN!)/\(TGWebHookRouteName)")!)
```
```swift
/// Add route for webhook. For example Vapor:

/// routes.swift
func routes(_ app: Application) throws {
    try app.register(collection: TelegramController())
}


/// TelegramController.swift
final class TelegramController: RouteCollection {
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.post(TGWebHookRouteName, use: telegramWebHook)
    }

    func telegramWebHook(_ req: Request) async throws -> Bool {
        let update: TGUpdate = try req.content.decode(TGUpdate.self)
        Task { await bot.processing(updates: [update]) }
        return true
    }
}
```
### Start bot with added handlers
```swift
let bot: TGBot = try await .init(connectionType: connectionType,
                                 tgClient: TGClientDefault(),
                                 tgURI: TGBot.standardTGURL,
                                 botId: botId,
                                 log: logger)

/// add dispatcher with some bot logic
try await bot.add(dispatcher: TestDispatcher(bot: bot, logger: logger))
/// try await bot.add(dispatcher: SecondDispatcher(bot: bot, logger: logger))
/// etc

try await bot.start()
```

### TestDispatcher code example
```swift
import SwiftTelegramBot

class TestDispatcher: TGDefaultDispatcher, @unchecked Sendable {
        
    override
    func handle() async {
        /// defaultBaseHandler example
        await add(TGBaseHandler({ update in
            guard let message = update.message else { return }
            let params: TGSendMessageParams = .init(chatId: .chat(message.chat.id), text: "TGBaseHandler")
            try await self.bot.sendMessage(params: params)
        }))

        /// commandPingHandler example
        await add(TGCommandHandler(commands: ["/ping"]) { update in
            try await update.message?.reply(text: "pong", bot: self.bot)
        })

        /// commandShowButtonsHandler example
        await add(TGCommandHandler(commands: ["/show_buttons"]) { update in
            guard let userId = update.message?.from?.id else { fatalError("user id not found") }
            let buttons: [[TGInlineKeyboardButton]] = [
                [.init(text: "Button 1", callbackData: "press 1"), .init(text: "Button 2", callbackData: "press 2")]
            ]
            let keyboard: TGInlineKeyboardMarkup = .init(inlineKeyboard: buttons)
            let params: TGSendMessageParams = .init(chatId: .chat(userId),
                                                    text: "Keyboard active",
                                                    replyMarkup: .inlineKeyboardMarkup(keyboard))
            try await self.bot.sendMessage(params: params)
        })

        /// buttonsActionHandler 1 example
        await add(TGCallbackQueryHandler(pattern: "press 1") { update in
            await self.bot.log.info("press 1")
            guard let userId = update.callbackQuery?.from.id else { fatalError("user id not found") }
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try await self.bot.answerCallbackQuery(params: params)
            try await self.bot.sendMessage(params: .init(chatId: .chat(userId), text: "press 1"))
        })

        /// buttonsActionHandler 2 example
        await add(TGCallbackQueryHandler(pattern: "press 2") { update in
            await self.bot.log.info("press 2")
            guard let userId = update.callbackQuery?.from.id else { fatalError("user id not found") }
            let params: TGAnswerCallbackQueryParams = .init(callbackQueryId: update.callbackQuery?.id ?? "0",
                                                            text: update.callbackQuery?.data  ?? "data not exist",
                                                            showAlert: nil,
                                                            url: nil,
                                                            cacheTime: nil)
            try await self.bot.answerCallbackQuery(params: params)
            try await self.bot.sendMessage(params: .init(chatId: .chat(userId), text: "press 2"))
        })
    }
}
```

# Advanced Example Usage
## HTTP clients
Use `TGClientDefault()` with or without a web framework, or implement `TGClientPrtcl` to use your own HTTP transport with support for `multipart/form-data`.
You can see an example here: [TGClientDefault](https://github.com/nerzh/swift-telegram-bot/blob/master/Sources/SwiftTelegramBot/Bot/Helpers/TGClientDefault.swift)

```swift
public protocol TGClientPrtcl: Sendable {
    
    @discardableResult
    func post<Params: Encodable, Response: Decodable>(_ url: URL, params: Params?, as mediaType: HTTPMediaType?) async throws -> Response
    
    @discardableResult
    func post<Response: Decodable>(_ url: URL) async throws -> Response
}
```

### Rate limiting

`TGBot` limits outgoing requests through both the default and custom clients. Configure `apiRequestLimitLongPolling` (default: 5 requests per second) or `apiRequestLimitWebHook` (default: 30 requests per second) in the bot initializer. Pass `nil` to disable the limiter for that connection type.

With rate limiting enabled, `await bot.tgClient` returns a client wrapper that waits for a slot before each `post` call. Keep a reference to the client passed to `TGBot` if you need its concrete type or configuration. Requests sent directly through that original client bypass the bot's limiter.

The standalone `LimiterAsync` type is provided by the `SwiftExtensionsPack` module. Using the bot's built-in rate limiting does not require creating or importing a limiter yourself.

### Errors and retry delays

`TGClientDefault` exposes HTTP and Telegram error details through `BotError.httpStatusCode`, `BotError.errorCode`, and `BotError.parameters`. These optional properties let you inspect values such as `error.parameters?.retryAfter` without parsing the error description. Non-200 HTTP responses are reported as server errors.

With rate limiting enabled, a Telegram 429 error containing a positive `retry_after` blocks new requests through that bot's client for at least that duration. The failed call still throws; it is not automatically sent again. Long polling continues requesting updates after the wait. Custom HTTP clients are responsible for their own response decoding; errors without these details cannot trigger this pause.

### Add to your Vapor project with Swift Package Manager
Configure your `Package.swift`:

```swift
// swift-tools-version:6.2

import PackageDescription

var packageDependencies: [Package.Dependency] = [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.57.0")),
]

packageDependencies.append(.package(url: "https://github.com/nerzh/swift-telegram-bot", .upToNextMajor(from: "10.4.0")))


let package = Package(
    name: "Telegram-bot-example",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: packageDependencies,
    targets: [
        .executableTarget(
            name: "Telegram-bot-example",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "SwiftTelegramBot", package: "swift-telegram-bot"),
            ]
        )
    ]
)



```
# Acknowledgments

Inspired by [Telegrammer](https://github.com/givip/Telegrammer)
