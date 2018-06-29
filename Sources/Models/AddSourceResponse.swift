import Foundation

public class AddSourceResponse: Codable {

    /// The payment source type
    public var type: String

    /// The customer to which the payment source is linked
    public var customer: [String: String]

    /// Gateway response code
    public var responseCode: String

    /// The unique identifier of the payment source that can be later used for payments
    public var id: String?

    public init(type: String, customer: [String: String], responseCode: String, id: String? = nil) {
        self.type = type
        self.customer = customer
        self.responseCode = responseCode
        self.id = id
    }

}
