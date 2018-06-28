import Foundation

/// A destination for OpenPay payments
public class PaymentDestination: Codable {

    /// The OpenPay account identifier */
    public var id: String

    /// The amount to be credited to the destination in the major currency unit */
    public var amount: Int

    public init(id: String, amount: Int) {
        self.id = id
        self.amount = amount
    }

}
