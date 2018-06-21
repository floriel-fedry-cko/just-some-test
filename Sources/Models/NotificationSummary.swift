import Foundation

public class NotificationSummary: Codable {

    /** The links related to the notification */
    public var links: Links?

    public var id: NotificationId?

    /** Whether the notification eventually succeeded */
    public var success: Bool?

    /** The notification endpoint */
    public var url: String?

    public class Links: Codable {

        public var `self`: String?

        public init(`sel`: String? = nil) {
            self.`self` = `sel`
        }

    }

    public init(links: Links? = nil, id: NotificationId? = nil, success: Bool? = nil, url: String? = nil) {
        self.links = links
        self.id = id
        self.success = success
        self.url = url
    }

}
