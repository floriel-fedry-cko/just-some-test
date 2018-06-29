import Foundation

/// A token payment source
public class PaymentRequestTokenSource: PaymentRequestSource {
    
    let token: String
    
    var billingAddress: Address?
    
    var phone: PhoneNumber?

    public init(token: String, billingAddress: Address? = nil, phone: PhoneNumber? = nil) {
        self.token = token
        self.billingAddress = billingAddress
        self.phone = phone
        super.init(type: "token")
    }
    
    required public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}
