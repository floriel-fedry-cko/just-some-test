import Foundation

public class WebhookRequest: Codable {

    /** The content type to be sent to the webhook endpoint */
    public enum ContentType: String, Codable {
        case json = "json"
        case xml = "xml"

        public static let cases: [ContentType] = [
          .json,
          .xml,
        ]
    }

    /** Your webhook endpoint */
    public var url: String

    /** Whether the webhook is active */
    public var active: Bool?

    /** The content type to be sent to the webhook endpoint */
    public var contentType: ContentType?

    public var eventTypes: WebhookEvents?

    public var headers: [String: String]?

    public init(url: String, active: Bool? = nil, contentType: ContentType? = nil, eventTypes: WebhookEvents? = nil, headers: [String: String]? = nil) {
        self.url = url
        self.active = active
        self.contentType = contentType
        self.eventTypes = eventTypes
        self.headers = headers
    }

}
