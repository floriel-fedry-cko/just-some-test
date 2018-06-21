import Foundation

/** Payment response */
public class PaymentAcceptedResponse: Codable {

    /** The status of the payment */
    public enum Status: String, Codable {
        case pending = "Pending"

        public static let cases: [Status] = [
          .pending,
        ]
    }

    /** Payment unique identifier */
    public var id: String

    /** The status of the payment */
    public var status: Status

    /** The customer to which this payment is linked */
    public var customer: [String: String]

    /** Provides 3D-Secure enrollment status */
    public var _3ds: [String: String]?

    /** Payment links */
    public var links: Links?

    /** Your reference for the payment request */
    public var reference: String?

    /** Payment response */
    public class Links: Codable {

        /** The URI of the payment */
        public var `self`: [String: String]

        /** The URI that the customer should be redirected to, to complete the payment */
        public var redirect: [String: String]?

        public init(`sel`: [String: String], redirect: [String: String]? = nil) {
            self.`self` = `sel`
            self.redirect = redirect
        }

    }

    public init(id: String, status: Status, customer: [String: String], _3ds: [String: String]? = nil, links: Links? = nil, reference: String? = nil) {
        self.id = id
        self.status = status
        self.customer = customer
        self._3ds = _3ds
        self.links = links
        self.reference = reference
    }

}
