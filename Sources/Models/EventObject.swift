import Foundation

public class EventObject: Codable {

    public var links: EventLinks?

    /** The date/time the event occurred */
    public var createdOn: String?

    public var data: DataType?

    public var id: EventId?

    /** The notifications (e.g. webhooks) that have been sent for the event */
    public var notifications: [NotificationSummary]?

    /** The event type */
    public var type: String?

    /** Determines the version of the event sent */
    public var version: String?

    public init(links: EventLinks? = nil, createdOn: String? = nil, data: DataType? = nil, id: EventId? = nil, notifications: [NotificationSummary]? = nil, type: String? = nil, version: String? = nil) {
        self.links = links
        self.createdOn = createdOn
        self.data = data
        self.id = id
        self.notifications = notifications
        self.type = type
        self.version = version
    }

}
