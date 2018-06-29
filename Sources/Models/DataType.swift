import Foundation

/// Event Data 
public class DataType: Codable {

    /// The status of the payment 
    public enum Status: String, Codable {
        case pending = "Pending"
        case authorized = "Authorized"
        case voided = "Voided"
        case partiallyCaptured = "Partially Captured"
        case captured = "Captured"
        case partiallyRefunded = "Partially Refunded"
        case refunded = "Refunded"
        case declined = "Declined"
        case cancelled = "Cancelled"

        public static let cases: [Status] = [
          .pending,
          .authorized,
          .voided,
          .partiallyCaptured,
          .captured,
          .partiallyRefunded,
          .refunded,
          .declined,
          .cancelled,
        ]
    }

    /// Provides 3D-Secure enrollment status if the payment was downgraded to Non-3DS 
    public var _3ds: [String: String]?

    /// The unique identifier for the action performed against this payment 
    public var actionId: String?

    /// The payment amount 
    public var amount: Int?

    /// Whether the payment request was approved 
    public var approved: Bool?

    /// The acquirer authorization code if the payment was Authorized 
    public var authCode: String?

    /// The three-letter ISO currency code of the payment 
    public var currency: String?

    /// The customer to which this payment is linked 
    public var customer: [String: String]?

    /// For OpenPay payments, destinations determine the proportion of the payment amount that should
        be credited to other OpenPay accounts
         
    public var destinations: [PaymentDestination]?

    /// Whether the payment was flagged by a risk check 
    public var flagged: Bool?

    /// Payment unique identifier 
    public var id: String?

    /// Set of key/value pairs that you can attach to a payment. It can be useful for storing additional information in a structured format 
    public var metadata: [String: String]?

    /// The date/time the payment was processed 
    public var processedOn: String?

    /// Your reference for the payment 
    public var reference: String?

    /// Gateway response code 
    public var responseCode: String?

    /// The Gateway response summary 
    public var responseSummary: String?

    /// The source of the payment 
    public var source: [String: String]?

    /// The status of the payment 
    public var status: Status?

    public init(_3ds: [String: String]? = nil, actionId: String? = nil, amount: Int? = nil, approved: Bool? = nil,
                authCode: String? = nil, currency: String? = nil, customer: [String: String]? = nil,
                destinations: [PaymentDestination]? = nil, flagged: Bool? = nil, id: String? = nil,
                metadata: [String: String]? = nil, processedOn: String? = nil, reference: String? = nil,
                responseCode: String? = nil, responseSummary: String? = nil, source: [String: String]? = nil,
                status: Status? = nil) {
        self._3ds = _3ds
        self.actionId = actionId
        self.amount = amount
        self.approved = approved
        self.authCode = authCode
        self.currency = currency
        self.customer = customer
        self.destinations = destinations
        self.flagged = flagged
        self.id = id
        self.metadata = metadata
        self.processedOn = processedOn
        self.reference = reference
        self.responseCode = responseCode
        self.responseSummary = responseSummary
        self.source = source
        self.status = status
    }

}
