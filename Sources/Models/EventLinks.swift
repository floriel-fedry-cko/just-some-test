import Foundation

/// The links related to the event 
public class EventLinks: Codable {

    /// The URI of the event 
    public var `self`: [String: String]?

    /// A link to retry all of the webhooks configured for the event 
    public var webhooksRetry: [String: String]?

    public init(`sel`: [String: String]? = nil, webhooksRetry: [String: String]? = nil) {
        self.`self` = `sel`
        self.webhooksRetry = webhooksRetry
    }

}
