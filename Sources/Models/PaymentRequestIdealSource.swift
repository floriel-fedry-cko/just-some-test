//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

/** iDEAL Source */
public class PaymentRequestIdealSource: Codable {

    public init() {
    }


    public required init(from decoder: Decoder) throws {
    }

    public func encode(to encoder: Encoder) throws {
    }

    public func isEqual(to object: Any?) -> Bool {
      guard object is PaymentRequestIdealSource else { return false }
      return true
    }

    public static func == (lhs: PaymentRequestIdealSource, rhs: PaymentRequestIdealSource) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}