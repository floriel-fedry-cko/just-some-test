import Foundation

/// A card payment source 
public class PaymentResponseCardSource: Codable {

    public init() {
    }


    public required init(from decoder: Decoder) throws {
    }

    public func encode(to encoder: Encoder) throws {
    }

    public func isEqual(to object: Any?) -> Bool {
      guard object is PaymentResponseCardSource else { return false }
      return true
    }

    public static func == (lhs: PaymentResponseCardSource, rhs: PaymentResponseCardSource) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
