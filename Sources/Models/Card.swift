import Foundation

public class Card: Codable {

    public var avsCheck: String?

    public var billingDetails: BillingDetails?

    public var customerId: String?

    public var cvvCheck: String?

    public var expiryMonth: String?

    public var expiryYear: String?

    public var fingerprint: String?

    public var id: String?

    public var last4: String?

    public var name: String?

    public var paymentMethod: String?

    public init(avsCheck: String? = nil, billingDetails: BillingDetails? = nil, customerId: String? = nil,
                cvvCheck: String? = nil, expiryMonth: String? = nil, expiryYear: String? = nil,
                fingerprint: String? = nil, id: String? = nil, last4: String? = nil, name: String? = nil,
                paymentMethod: String? = nil) {
        self.avsCheck = avsCheck
        self.billingDetails = billingDetails
        self.customerId = customerId
        self.cvvCheck = cvvCheck
        self.expiryMonth = expiryMonth
        self.expiryYear = expiryYear
        self.fingerprint = fingerprint
        self.id = id
        self.last4 = last4
        self.name = name
        self.paymentMethod = paymentMethod
    }

}
