import Foundation

/// The customer to which this payment is linked 
public class PaymentResponseCustomer: Codable {

    /// The unique identifier of the customer. This can be passed as a source when making a payment 
    public var id: String

    /// The customer email address 
    public var email: String?

    /// The customer name 
    public var name: String?

    public init(id: String, email: String? = nil, name: String? = nil) {
        self.id = id
        self.email = email
        self.name = name
    }

}
