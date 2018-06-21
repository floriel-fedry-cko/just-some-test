import Foundation

public class EventResult: Codable {

    public var data: [EventSummary]?

    /** The `from` query parameter */
    public var from: DateTime?

    /** The `limit` query parameter */
    public var limit: Int?

    /** The `skip` query parameter */
    public var skip: Int?

    /** The `to` query parameter */
    public var to: DateTime?

    /** The total number of events */
    public var totalCount: Int?

    public init(data: [EventSummary]? = nil, from: DateTime? = nil, limit: Int? = nil, skip: Int? = nil, to: DateTime? = nil, totalCount: Int? = nil) {
        self.data = data
        self.from = from
        self.limit = limit
        self.skip = skip
        self.to = to
        self.totalCount = totalCount
    }

}
