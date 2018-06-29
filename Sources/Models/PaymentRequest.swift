import Foundation

public class PaymentRequest: Codable {

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

    /// The three-letter ISO currency code
 
    public var currency: String

    public var source: PaymentRequestSource

    /// Whether to process this payment as a 3D-Secure 
    public var _3ds: Bool?

    /// The payment amount in the major currency.
    /// Omitting the amount or providing 0 will perform a card verification.
 
    public var amount: Int?

    /// Determines whether to attempt a 3D-Secure payment as non-3DS 
    /// should the card issuer not be enrolled.
    /// [Read more](https://docs.checkout.com/getting-started/merchant-api/3d-secure-charges/attempt-non-3d-secure-charge).
 
    public var attemptN3d: Bool?

    public var billingDescriptor: BillingDescriptor?

    /// Whether to capture the payment (if applicable) 
    public var capture: Bool?

    /// An ISO 8601 timestamp that determines when the payment should be captured. 
    /// Providing this field will automatically set `capture` to true.
 
    public var captureOn: String?

    /// Details of the customer associated with the payment 
    public var customer: Customer?

    /// A description of the payment 
    public var description: String?

    /// For OpenPay payments, destinations determine the proportion of the payment amount that should 
    /// be credited to other OpenPay accounts
 
    public var destinations: [PaymentDestination]?

    /// For redirect payment methods, overrides the default failure redirect URL configured on your account 
    public var failureUrl: URL?

    /// Set of key/value pairs that you can attach to a payment. It can be useful for storing additional information in a structured format 
    public var metadata: [String: String]?

    /// The IP address used to make the payment. Required for some risk checks. 
    public var paymentIp: String?

    /// Must be specified for card payments where the cardholder is not present (recurring or Merchant Offline Telephone Order) 
    public var paymentType: PaymentType?

    /// For payments that use stored card details such as recurring payments,
    /// an existing payment identifier from the recurring series or the Scheme Transaction Id. [Read more](https://docs.checkout.com/docs/stored-card-details). 
 
    public var previousPaymentId: String?

    public var recipient: PaymentRecipient?

    /// A reference you can later use to identify this payment such as an order number 
    public var reference: String?

    /// The payment shipping details 
    public var shipping: Shipping?

    /// Indicates whether risk checks for the requested payment should be skipped 
    public var skipRiskCheck: Bool?

    /// For redirect payment methods, overrides the default success redirect URL configured on your account 
    public var successUrl: URL?

    public class Customer: Codable {

        /// An optional email address to associate with the customer 
        public var email: String?

        /// The identifier of an existing customer. If neither customer `id` or `email` is provided
        /// a new customer will be registered
     
        public var id: String?

        /// The customer's name. This will only set the name for *new* customers 
        public var name: String?

        public init(email: String? = nil, id: String? = nil, name: String? = nil) {
            self.email = email
            self.id = id
            self.name = name
        }

    }

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

    public init(currency: String, source: PaymentRequestSource, _3ds: Bool? = nil, amount: Int? = nil, attemptN3d: Bool? = nil, billingDescriptor: BillingDescriptor? = nil, capture: Bool? = nil, captureOn: String? = nil, customer: Customer? = nil, description: String? = nil, destinations: [PaymentDestination]? = nil, failureUrl: URL? = nil, metadata: [String: String]? = nil, paymentIp: String? = nil, paymentType: PaymentType? = nil, previousPaymentId: String? = nil, recipient: PaymentRecipient? = nil, reference: String? = nil, shipping: Shipping? = nil, skipRiskCheck: Bool? = nil, successUrl: URL? = nil) {
        self.currency = currency
        self.source = source
        self._3ds = _3ds
        self.amount = amount
        self.attemptN3d = attemptN3d
        self.billingDescriptor = billingDescriptor
        self.capture = capture
        self.captureOn = captureOn
        self.customer = customer
        self.description = description
        self.destinations = destinations
        self.failureUrl = failureUrl
        self.metadata = metadata
        self.paymentIp = paymentIp
        self.paymentType = paymentType
        self.previousPaymentId = previousPaymentId
        self.recipient = recipient
        self.reference = reference
        self.shipping = shipping
        self.skipRiskCheck = skipRiskCheck
        self.successUrl = successUrl
    }

}
