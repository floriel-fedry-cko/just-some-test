import Foundation

/// Payment response 
public class VoidResponse: Codable {

    /// Payment unique identifier 
    public var id: String

    /// The unique identifier for the void action 
    public var actionId: String

    /// The void amount 
    public var amount: Int

    /// The three-letter ISO currency code of the payment 
    public var currency: String

    /// The status of the payment 
    public var status: String

    /// Gateway response code 
    public var responseCode: String

    /// The date/time the void was processed 
    public var processedOn: String

    /// The links related to the payment 
    public var links: Links

    /// Your reference for the void request 
    public var reference: String?

    /// The Gateway response summary 
    public var responseSummary: String?

    /// Payment response 
    public class Links: Codable {

        /// The URI of the payment 
        public var payment: [String: String]

        /// A link to the full response code details 
        public var responseCode: [String: String]?

        public init(payment: [String: String], responseCode: [String: String]? = nil) {
            self.payment = payment
            self.responseCode = responseCode
        }

    }

    public init(id: String, actionId: String, amount: Int, currency: String, status: String, responseCode: String, processedOn: String, links: Links, reference: String? = nil, responseSummary: String? = nil) {
        self.id = id
        self.actionId = actionId
        self.amount = amount
        self.currency = currency
        self.status = status
        self.responseCode = responseCode
        self.processedOn = processedOn
        self.links = links
        self.reference = reference
        self.responseSummary = responseSummary
    }

}
