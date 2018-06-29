import Foundation

/// iDEAL Source
public class PaymentRequestIdealSource: PaymentRequestSource {
    
    let issuerId: String

    public init(issuerId: String) {
        self.issuerId = issuerId
        super.init(type: "ideal")
    }
    
    required public init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
}
