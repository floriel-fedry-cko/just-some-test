//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

/** Payment source */
public class PaymentResponseSource: Codable {

    /** The payment source type. For any payment request sources that result in a card token (token, source ID etc.)
this will be `card` otherwise the name of the alternative payment method.
 */
    public var type: String

    /** The payment source owner's billing address */
    public var billingAddress: String?

    /** The payment source identifier that can be used for subsequent payments.
For new sources, this will only be returned if the payment was approved.
 */
    public var id: String?

    /** The payment source owner's phone number */
    public var phone: String?

    public init(type: String, billingAddress: String? = nil, id: String? = nil, phone: String? = nil) {
        self.type = type
        self.billingAddress = billingAddress
        self.id = id
        self.phone = phone
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case billingAddress = "billing_address"
        case id
        case phone
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(.type)
        billingAddress = try container.decodeIfPresent(.billingAddress)
        id = try container.decodeIfPresent(.id)
        phone = try container.decodeIfPresent(.phone)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(billingAddress, forKey: .billingAddress)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(phone, forKey: .phone)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? PaymentResponseSource else { return false }
      guard self.type == object.type else { return false }
      guard self.billingAddress == object.billingAddress else { return false }
      guard self.id == object.id else { return false }
      guard self.phone == object.phone else { return false }
      return true
    }

    public static func == (lhs: PaymentResponseSource, rhs: PaymentResponseSource) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}