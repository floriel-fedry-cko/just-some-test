import Foundation

/// Capture response
public class CaptureAcceptedResponse: Codable {

    /// The unique identifier for the capture action
    public var actionId: String

    /// Capture links
    public var links: Links?

    /// Your reference for the capture request
    public var reference: String?

    /// Capture response
    public class Links: Codable {

        /// The URI of the payment to be captured. Use this to check the status of the payment
        public var payment: [String: String]

        /// For some alternative payments, the URI that the customer should be redirected to, to complete the capture
        public var redirect: [String: String]?

        public init(payment: [String: String], redirect: [String: String]? = nil) {
            self.payment = payment
            self.redirect = redirect
        }

    }

    public init(actionId: String, links: Links? = nil, reference: String? = nil) {
        self.actionId = actionId
        self.links = links
        self.reference = reference
    }

}
