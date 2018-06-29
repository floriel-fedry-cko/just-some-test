import Foundation

/// An existing payment source
public class PaymentRequestIdSource: PaymentRequestSource {
    
    let id: String
    
    var cvv: String?

    public init(id: String, cvv: String? = nil) {
        self.id = id
        self.cvv = cvv
        super.init(type: "id")
    }
    
    required public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}
