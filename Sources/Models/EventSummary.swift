import Foundation

public class EventSummary: Codable {

    public var links: EventLinks?

    /** The date/time the event occurred */
    public var createdOn: String?

    /** The event identifier */
    public var id: String?

    /** The event type */
    public var type: String?

    public init(links: EventLinks? = nil, createdOn: String? = nil, id: String? = nil, type: String? = nil) {
        self.links = links
        self.createdOn = createdOn
        self.id = id
        self.type = type
    }

}
