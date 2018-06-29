import Foundation

/// The source of the payment 
public class PaymentRequestSource: Codable {

    /// The payment source type 
    public var type: String

    public init(type: String) {
        self.type = type
    }

}
