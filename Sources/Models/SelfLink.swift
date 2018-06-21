import Foundation

public class SelfLink: Codable {

    /** The link type */
    public enum Rel: String, Codable {
        case `self` = "self"

        public static let cases: [Rel] = [
          .`self`,
        ]
    }

    /** The link type */
    public var rel: Rel

    public init(rel: Rel) {
        self.rel = rel
    }

}
