//
//
//
//  Created by Oleh Hudeichuk on 02.06.2021.
//

import Foundation

public class TGFilter: @unchecked Sendable {

    public enum Operation: Sendable {
        case and
        case or
        case not
    }

    public typealias Compound = (lhs: TGFilter, rhs: TGFilter, op: Operation)

    private let compoundFilter: SendableValue<Compound?> = .init(nil)

    public init() {}
    
    init(lhs: TGFilter, rhs: TGFilter, op: Operation) async {
        await compoundFilter.change { $0 = (lhs: lhs, rhs: rhs, op: op) }
    }

    public func check(_ mess: TGMessage) async -> Bool {
        if let filter = await compoundFilter.value {
            let lhs = await (filter.lhs).check(mess)
            let rhs = await (filter.rhs).check(mess)
            switch filter.op {
            case .and:
                return  lhs && rhs
            case .or:
                return lhs || rhs
            case .not:
                return rhs
            }
        } else {
            return self.filter(message: mess)
        }
    }

    public func filter(message: TGMessage) -> Bool {
        return false
    }

    public static func &&(lhs: TGFilter, rhs: TGFilter) async -> TGFilter {
        return await TGFilter(lhs: lhs, rhs: rhs, op: .and)
    }

    public static func ||(lhs: TGFilter, rhs: TGFilter) async -> TGFilter {
        return await TGFilter(lhs: lhs, rhs: rhs, op: .or)
    }

    public static prefix func !(filter: TGFilter) async -> TGFilter {
        return await TGFilter(lhs: filter, rhs: filter, op: .not)
    }
}
