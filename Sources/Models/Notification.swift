import Foundation

public class Notification: Codable {

    /// The links related to the notification 
    public var links: Links?

    /// The notification events ordered by timestamp in descending order (latest first) 
    public var attempts: [NotificationAttempt]?

    /// The content type of the data sent to the endpoint 
    public var contentType: String?

    public var id: NotificationId?

    /// Whether the notification eventually succeeded 
    public var success: Bool?

    /// The notification endpoint 
    public var url: String?

    public class Links: Codable {

        /// A link to retry the notification to the configured webhook 
        public var retry: [String: String]?

        /// The URI of the notification 
        public var `self`: [String: String]?

        public init(retry: [String: String]? = nil, `sel`: [String: String]? = nil) {
            self.retry = retry
            self.`self` = `sel`
        }

    }

    public init(links: Links? = nil, attempts: [NotificationAttempt]? = nil, contentType: String? = nil, id: NotificationId? = nil, success: Bool? = nil, url: String? = nil) {
        self.links = links
        self.attempts = attempts
        self.contentType = contentType
        self.id = id
        self.success = success
        self.url = url
    }

}
