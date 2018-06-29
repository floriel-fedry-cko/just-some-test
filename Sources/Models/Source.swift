import Foundation

public class Source: Codable {

    /// The payment source type 
    public var type: String

    /// The links related to the payment source 
    public var links: Links?

    /// The unique identifier of the payment source that can be later used for payments 
    public var id: String?

    public class Links: Codable {

        /// The URI of the payment source 
        public var `self`: [String: String]

        public init(`sel`: [String: String]) {
            self.`self` = `sel`
        }

    }

    public init(type: String, links: Links? = nil, id: String? = nil) {
        self.type = type
        self.links = links
        self.id = id
    }

}
