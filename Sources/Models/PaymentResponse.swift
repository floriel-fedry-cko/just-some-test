import Foundation

/** Payment Response */
public class PaymentResponse: Codable {

    /** The status of the payment */
    public enum Status: String, Codable {
        case pending = "Pending"
        case authorized = "Authorized"
        case cardVerified = "Card Verified"
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
          .cardVerified,
          .voided,
          .partiallyCaptured,
          .captured,
          .partiallyRefunded,
          .refunded,
          .declined,
          .cancelled,
        ]
    }

    /** Payment unique identifier */
    public var id: String

    /** The unique identifier for the action performed against this payment */
    public var actionId: String

    /** The payment amount */
    public var amount: Int

    /** The three-letter ISO currency code of the payment */
    public var currency: String

    /** Whether the payment request was approved */
    public var approved: Bool

    /** The status of the payment */
    public var status: Status

    /** Gateway response code */
    public var responseCode: String

    /** The date/time the payment was processed */
    public var processedOn: String

    /** The customer to which this payment is linked */
    public var customer: [String: String]

    /** The source of the payment */
    public var source: [String: String]

    /** The links related to the payment */
    public var links: Links

    /** Provides 3D-Secure enrollment status if the payment was downgraded to Non-3DS */
    public var _3ds: [String: String]?

    /** The acquirer authorization code if the payment was Authorized */
    public var authCode: String?

    /** Your reference for the payment */
    public var reference: String?

    /** The Gateway response summary */
    public var responseSummary: String?

    /** Returns the payments risk assessment results */
    public var risk: Risk?

    /** Payment Response */
    public class Links: Codable {

        /** The URI of the payment */
        public var `self`: [String: String]

        /** A link to the payment's associated actions */
        public var actions: [String: String]

        /** A link to capture the payment, where applicable */
        public var capture: [String: String]?

        /** A link to refund the payment, where applicable */
        public var refund: [String: String]?

        /** A link to the full response code details */
        public var responseCode: [String: String]?

        /** A link to void the payment, where applicable */
        public var void: [String: String]?

        public init(`sel`: [String: String], actions: [String: String], capture: [String: String]? = nil, refund: [String: String]? = nil, responseCode: [String: String]? = nil, void: [String: String]? = nil) {
            self.`self` = `sel`
            self.actions = actions
            self.capture = capture
            self.refund = refund
            self.responseCode = responseCode
            self.void = void
        }

    }

    /** Payment Response */
    public class Risk: Codable {

        /** Whether the payment was flagged by a risk check */
        public var flagged: Bool?

        public init(flagged: Bool? = nil) {
            self.flagged = flagged
        }

    }

    public init(id: String, actionId: String, amount: Int, currency: String, approved: Bool, status: Status, responseCode: String, processedOn: String, customer: [String: String], source: [String: String], links: Links, _3ds: [String: String]? = nil, authCode: String? = nil, reference: String? = nil, responseSummary: String? = nil, risk: Risk? = nil) {
        self.id = id
        self.actionId = actionId
        self.amount = amount
        self.currency = currency
        self.approved = approved
        self.status = status
        self.responseCode = responseCode
        self.processedOn = processedOn
        self.customer = customer
        self.source = source
        self.links = links
        self._3ds = _3ds
        self.authCode = authCode
        self.reference = reference
        self.responseSummary = responseSummary
        self.risk = risk
    }

}
