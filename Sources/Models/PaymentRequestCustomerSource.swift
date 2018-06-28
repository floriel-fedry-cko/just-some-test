import Foundation

/** A customer source */
public class PaymentRequestCustomerSource: Codable {
    
    let type = "customer"
    
    var id: String?
    
    var email: String?

    public init(id: String? = nil, email: String? = nil) {
        self.id = id
        self.email = email
    }

}
