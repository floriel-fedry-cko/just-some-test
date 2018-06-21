import Foundation

public class Webhook: Codable {

    public enum ContentType: String, Codable {
        case json = "json"
        case xml = "xml"

        public static let cases: [ContentType] = [
          .json,
          .xml,
        ]
    }

    public var links: Links?

    public var active: Bool?

    public var contentType: ContentType?

    public var eventTypes: WebhookEvents?

    public var headers: [String: String]?

    public var id: String?

    public var url: String?

    public class Links: Codable {

        /** The URI of the payment source */
        public var `self`: [String: String]?

        public init(`sel`: [String: String]? = nil) {
            self.`self` = `sel`
        }

    }

    public init(links: Links? = nil, active: Bool? = nil, contentType: ContentType? = nil, eventTypes: WebhookEvents? = nil, headers: [String: String]? = nil, id: String? = nil, url: String? = nil) {
        self.links = links
        self.active = active
        self.contentType = contentType
        self.eventTypes = eventTypes
        self.headers = headers
        self.id = id
        self.url = url
    }

}
