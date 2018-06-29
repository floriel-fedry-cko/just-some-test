import Foundation

/// Payment response 
public class Payment: Codable {

    /// The status of the payment 
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

    /// Must be specified for card payments where the cardholder is not present (recurring or Merchant Offline Telephone Order) 
    public enum PaymentType: String, Codable {
        case regular = "Regular"
        case recurring = "Recurring"
        case moto = "MOTO"

        public static let cases: [PaymentType] = [
          .regular,
          .recurring,
          .moto,
        ]
    }

    /// Payment unique identifier 
    public var id: String

    /// The date/time the payment was requested 
    public var requestedOn: String

    /// The original payment amount 
    public var amount: Int

    /// The three-letter ISO currency code of the payment 
    public var currency: String

    /// The status of the payment 
    public var status: Status

    /// The links related to the payment 
    public var links: Links

    /// Provides information relating to the processing of 3D-Secure payments 
    public var _3ds: [String: String]?

    public var billingDescriptor: BillingDescriptor?

    /// The customer to which this payment is linked 
    public var customer: Customer?

    /// A description of the payment 
    public var description: String?

    /// For OpenPay payments, destinations determine the proportion of the payment amount credited to other OpenPay accounts
 
    public var destinations: [PaymentDestination]?

    /// Set of key/value pairs that you can attach to a payment. It can be useful for storing additional information in a structured format 
    public var metadata: [String: String]?

    /// The IP address used to make the payment 
    public var paymentIp: String?

    /// Must be specified for card payments where the cardholder is not present (recurring or Merchant Offline Telephone Order) 
    public var paymentType: PaymentType?

    public var recipient: PaymentRecipient?

    /// Your reference for the payment 
    public var reference: String?

    /// Returns the payments risk assessment results 
    public var risk: Risk?

    /// The payment shipping details 
    public var shipping: Shipping?

    /// The source of the payment 
    public var source: [String: String]?

    /// Payment response 
    public class Links: Codable {

        /// The URI of the payment 
        public var `self`: [String: String]

        /// A link to the payment's associated actions 
        public var actions: [String: String]

        /// A link to capture the payment, where applicable 
        public var capture: [String: String]?

        /// A link to refund the payment, where applicable 
        public var refund: [String: String]?

        /// A link to void the payment, where applicable 
        public var void: [String: String]?

        public init(`sel`: [String: String], actions: [String: String], capture: [String: String]? = nil, refund: [String: String]? = nil, void: [String: String]? = nil) {
            self.`self` = `sel`
            self.actions = actions
            self.capture = capture
            self.refund = refund
            self.void = void
        }

    }

    /// Payment response 
    public class Customer: Codable {

        /// The unique identifier of the customer. This can be passed as a source when making a payment 
        public var id: String

        /// The customer email address 
        public var email: String?

        /// The customer name 
        public var name: String?

        public init(id: String, email: String? = nil, name: String? = nil) {
            self.id = id
            self.email = email
            self.name = name
        }

    }

    /// Payment response 
    public class Risk: Codable {

        /// Whether the payment was flagged by a risk check 
        public var flagged: Bool?

        public init(flagged: Bool? = nil) {
            self.flagged = flagged
        }

    }

    /// Payment response 
    public class Shipping: Codable {

        /// The shipping address 
        public var address: String?

        /// The phone number associated with the shipping address 
        public var phone: String?

        public init(address: String? = nil, phone: String? = nil) {
            self.address = address
            self.phone = phone
        }

    }

    public init(id: String, requestedOn: String, amount: Int, currency: String, status: Status, links: Links, _3ds: [String: String]? = nil, billingDescriptor: BillingDescriptor? = nil, customer: Customer? = nil, description: String? = nil, destinations: [PaymentDestination]? = nil, metadata: [String: String]? = nil, paymentIp: String? = nil, paymentType: PaymentType? = nil, recipient: PaymentRecipient? = nil, reference: String? = nil, risk: Risk? = nil, shipping: Shipping? = nil, source: [String: String]? = nil) {
        self.id = id
        self.requestedOn = requestedOn
        self.amount = amount
        self.currency = currency
        self.status = status
        self.links = links
        self._3ds = _3ds
        self.billingDescriptor = billingDescriptor
        self.customer = customer
        self.description = description
        self.destinations = destinations
        self.metadata = metadata
        self.paymentIp = paymentIp
        self.paymentType = paymentType
        self.recipient = recipient
        self.reference = reference
        self.risk = risk
        self.shipping = shipping
        self.source = source
    }

}
