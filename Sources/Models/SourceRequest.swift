import Foundation

public class SourceRequest: Codable {

    /// The payment source type 
    public var type: String

    /// The payment source owner's billing address 
    public var billingAddress: String?

    /// Details of the customer to associate with the source 
    public var customer: Customer?

    /// The payment source owner's phone number 
    public var phone: String?

    /// A reference you can later use to identify the source 
    public var reference: String?

    public class Customer: Codable {

        /// An optional email address to associate with the customer 
        public var email: String?

        /// The identifier of an existing customer. If neither customer `id` or `email` is provided
        /// a new customer will be registered
     
        public var id: String?

        /// The customer's name. This will only set the name for *new* customers 
        public var name: String?

        public init(email: String? = nil, id: String? = nil, name: String? = nil) {
            self.email = email
            self.id = id
            self.name = name
        }

    }

    public init(type: String, billingAddress: String? = nil, customer: Customer? = nil, phone: String? = nil, reference: String? = nil) {
        self.type = type
        self.billingAddress = billingAddress
        self.customer = customer
        self.phone = phone
        self.reference = reference
    }

}
