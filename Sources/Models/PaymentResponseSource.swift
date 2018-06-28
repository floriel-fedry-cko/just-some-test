import Foundation

/** Payment source */
public class PaymentResponseSource: Codable {

    /// The payment source type. For any payment request sources that result in a card token (token, source ID etc.)
    /// this will be `card` otherwise the name of the alternative payment method.
    public var type: String

    /** The payment source owner's billing address */
    public var billingAddress: String?

    /// The payment source identifier that can be used for subsequent payments.
    /// For new sources, this will only be returned if the payment was approved.
    public var id: String?

    /** The payment source owner's phone number */
    public var phone: String?

    public init(type: String, billingAddress: String? = nil, id: String? = nil, phone: String? = nil) {
        self.type = type
        self.billingAddress = billingAddress
        self.id = id
        self.phone = phone
    }

}
