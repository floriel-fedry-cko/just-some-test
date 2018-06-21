import Foundation

public class PaymentAction: Codable {

    /** The type of action */
    public enum `Type`: String, Codable {
        case authorization = "Authorization"
        case cardVerification = "Card Verification"
        case void = "Void"
        case capture = "Capture"
        case refund = "Refund"

        public static let cases: [`Type`] = [
          .authorization,
          .cardVerification,
          .void,
          .capture,
          .refund,
        ]
    }

    /** The unique identifier of the payment action */
    public var id: String

    /** The type of action */
    public var type: `Type`

    /** The action amount */
    public var amount: Int

    /** Gateway response code */
    public var responseCode: String

    /** The date/time the action was processed */
    public var processedOn: String

    /** The links related to the action */
    public var links: Links?

    /** The acquirer authorization code for cards */
    public var authCode: String?

    /** Set of key/value pairs that you can attach to an action */
    public var metadata: [String: String]?

    /** Your reference for the action */
    public var reference: String?

    /** The Gateway response summary */
    public var responseSummary: String?

    public class Links: Codable {

        /** A link to the full response code details */
        public var responseCode: [String: String]?

        public init(responseCode: [String: String]? = nil) {
            self.responseCode = responseCode
        }

    }

    public init(id: String, type: `Type`, amount: Int, responseCode: String, processedOn: String, links: Links? = nil, authCode: String? = nil, metadata: [String: String]? = nil, reference: String? = nil, responseSummary: String? = nil) {
        self.id = id
        self.type = type
        self.amount = amount
        self.responseCode = responseCode
        self.processedOn = processedOn
        self.links = links
        self.authCode = authCode
        self.metadata = metadata
        self.reference = reference
        self.responseSummary = responseSummary
    }

}
