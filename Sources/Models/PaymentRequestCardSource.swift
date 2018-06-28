import Foundation

/** A card payment source */
public class PaymentRequestCardSource: Codable {
    
    public let type = "card"
    
    public var number: String
    
    public var expiryMonth: Int
    
    public var expiryYear: Int
    
    public var name: String?
    
    public var cvv: String?
    
    public var billingAddress: Address?
    
    public var phone: PhoneNumber?

    public init(number: String, expiryMonth: Int, expiryYear: Int, name: String? = nil, cvv: String? = nil, billingAddress: Address? = nil, phone: PhoneNumber? = nil) {
        self.number = number
        self.expiryMonth = expiryMonth
        self.expiryYear = expiryYear
        self.name = name
        self.cvv = cvv
        self.billingAddress = billingAddress
        self.phone = phone
    }

}
