import Foundation

public class Link: Codable {

    /** The link URL */
    public var href: String

    public init(href: String) {
        self.href = href
    }

}
