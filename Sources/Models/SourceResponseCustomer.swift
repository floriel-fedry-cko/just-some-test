import Foundation

/** The customer to which the payment source is linked */
public class SourceResponseCustomer: Codable {

    /** The unique identifier of the customer */
    public var id: String

    /** The customer email address */
    public var email: String?

    /** The customer name */
    public var name: String?

    public init(id: String, email: String? = nil, name: String? = nil) {
        self.id = id
        self.email = email
        self.name = name
    }

}
