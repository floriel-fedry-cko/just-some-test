//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

/** A customer source */
public class PaymentRequestCustomerSource: Codable {

    public init() {
    }


    public required init(from decoder: Decoder) throws {
    }

    public func encode(to encoder: Encoder) throws {
    }

    public func isEqual(to object: Any?) -> Bool {
      guard object is PaymentRequestCustomerSource else { return false }
      return true
    }

    public static func == (lhs: PaymentRequestCustomerSource, rhs: PaymentRequestCustomerSource) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}