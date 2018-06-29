import Foundation

/// A customer source
public class PaymentRequestCustomerSource: PaymentRequestSource {
    
    var id: String?
    
    var email: String?

    public init(id: String? = nil, email: String? = nil) {
        self.id = id
        self.email = email
        super.init(type: "customer")
    }
    
    required public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}
