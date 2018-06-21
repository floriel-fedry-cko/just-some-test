import Foundation

public class SubmitBatchResponse: Codable {

    /** Batch identifier */
    public var id: String

    /** The batch status */
    public var status: String

    public var links: Links

    public class Links: Codable {

        /** The URI of the batch */
        public var `self`: [String: String]

        public init(`sel`: [String: String]) {
            self.`self` = `sel`
        }

    }

    public init(id: String, status: String, links: Links) {
        self.id = id
        self.status = status
        self.links = links
    }

}
