import Foundation

/** An existing payment source */
public class PaymentRequestIdSource: Codable {
    
    let type = "id"
    
    let id: String
    
    var cvv: String?

    public init(id: String, cvv: String? = nil) {
        self.id = id
        self.cvv = cvv
    }

}
