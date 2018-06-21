import Foundation

/** Void response */
public class VoidAcceptedResponse: Codable {

    /** The unique identifier for the void action */
    public var actionId: String

    /** Void links */
    public var links: Links?

    /** Your reference for the void request */
    public var reference: String?

    /** Void response */
    public class Links: Codable {

        /** The URI of the payment to be refund. Use this to check the status of the payment */
        public var payment: [String: String]

        public init(payment: [String: String]) {
            self.payment = payment
        }

    }

    public init(actionId: String, links: Links? = nil, reference: String? = nil) {
        self.actionId = actionId
        self.links = links
        self.reference = reference
    }

}
