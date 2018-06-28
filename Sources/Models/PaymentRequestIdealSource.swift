import Foundation

/** iDEAL Source */
public class PaymentRequestIdealSource: Codable {
    
    let type = "ideal"
    
    let issuerId: String

    public init(issuerId: String) {
        self.issuerId = issuerId
    }

}
