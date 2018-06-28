import Foundation

/** A token payment source */
public class PaymentRequestTokenSource: Codable {
    
    let type = "token"
    
    let token: String
    
    var billingAddress: Address?
    
    var phone: PhoneNumber?

    public init(token: String, billingAddress: Address? = nil, phone: PhoneNumber? = nil) {
        self.token = token
        self.billingAddress = billingAddress
        self.phone = phone
    }

}
