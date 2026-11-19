import Logging
import XCTest
@testable import SwiftTelegramBot

final class DispatcherRemovalTests: XCTestCase, @unchecked Sendable {
    func testRemoveOneDispatcherSubclassFromMixedCollection() async throws {
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: TGClientDefault(), botId: "test")
        let first = FirstDispatcher(bot: bot, logger: .init(label: "dispatcher-tests"))
        let second = SecondDispatcher(bot: bot, logger: .init(label: "dispatcher-tests"))
        try await bot.add(first, second)

        await bot.remove(dispatcher: second)

        let remaining = await bot.dispatchers
        XCTAssertEqual(remaining.count, 1)
        XCTAssertTrue(remaining.first as? FirstDispatcher === first)
        await bot.remove(dispatcher: second)
        let afterRepeatedRemoval = await bot.dispatchers
        XCTAssertEqual(afterRepeatedRemoval.count, 1)
    }

    func testRemoveUsesCustomEqualityAndKeepsOtherTypesWithTheSameName() async throws {
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: TGClientDefault(), botId: "test")
        let named = NamedDispatcher(name: "same", bot: bot)
        let target = KeyedDispatcher(key: 1, bot: bot)
        let equalTarget = KeyedDispatcher(key: 1, bot: bot)
        let other = KeyedDispatcher(key: 2, bot: bot)
        try await bot.add(named, target, other, equalTarget)

        await bot.remove(dispatcher: target)

        let remaining = await bot.dispatchers
        XCTAssertEqual(remaining.count, 2)
        XCTAssertEqual(remaining.first as? NamedDispatcher, named)
        XCTAssertEqual(remaining.last as? KeyedDispatcher, other)
    }

    func testRemovePreservesDefaultNameEquality() async throws {
        let bot = try await TGBot(connectionType: .longpolling(), tgClient: TGClientDefault(), botId: "test")
        let first = NamedDispatcher(name: "first", bot: bot)
        let equalFirst = NamedDispatcher(name: "first", bot: bot)
        let second = NamedDispatcher(name: "second", bot: bot)
        try await bot.add(first, second, equalFirst)

        await bot.remove(dispatcher: first)

        let remaining = await bot.dispatchers
        XCTAssertEqual(remaining.count, 1)
        XCTAssertEqual(remaining.first as? NamedDispatcher, second)
    }
}

private final class FirstDispatcher: TGDefaultDispatcher, @unchecked Sendable {
    override func handle() async {}
}

private final class SecondDispatcher: TGDefaultDispatcher, @unchecked Sendable {
    override func handle() async {}
}

private struct NamedDispatcher: TGDefaultDispatcherPrtcl {
    let name: String
    let bot: TGBot
    let log = Logger(label: "dispatcher-tests")
    let id = SendableValue(0)
    let handlersGroup = HandlersGroupActor()

    func handle() async {}
}

private struct KeyedDispatcher: TGDefaultDispatcherPrtcl {
    let key: Int
    let bot: TGBot
    let name = "same"
    let log = Logger(label: "dispatcher-tests")
    let id = SendableValue(0)
    let handlersGroup = HandlersGroupActor()

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.key == rhs.key
    }

    func handle() async {}
}
