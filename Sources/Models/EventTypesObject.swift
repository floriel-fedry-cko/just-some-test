import Foundation

public class EventTypesObject: Codable {

    public var eventTypes: [String]?

    public var version: String?

    public init(eventTypes: [String]? = nil, version: String? = nil) {
        self.eventTypes = eventTypes
        self.version = version
    }

    private enum CodingKeys: String, CodingKey {
        case eventTypes = "event_types"
        case version
    }

}
