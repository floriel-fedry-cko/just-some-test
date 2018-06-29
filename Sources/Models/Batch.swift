import Foundation

public class Batch: Codable {

    /// Batch identifier
    public var id: String

    /// The status of the batch
    public var status: String

    public var links: Links

    public class Links: Codable {

        /// The URI of the batch
        public var `self`: [String: String]

        public init(`sel`: [String: String]) {
            self.`self` = `sel`
        }

        private enum CodingKeys: String, CodingKey {
            case `self` = "self"
        }

    }

    public init(id: String, status: String, links: Links) {
        self.id = id
        self.status = status
        self.links = links
    }

}
