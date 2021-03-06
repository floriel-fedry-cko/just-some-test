import Foundation

extension API.Events {

    /// Retrieves the event with the specified identifier string. The event `data` includes the full event details, the schema of which will vary based on the `type`.
 
    public enum GetEventsByEventId {

        public static let service = APIService<Response>(id: "getEventsByEventId", tag: "Events", method: "GET", path: "/events/{eventId}", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /// The event identifier 
                public var eventId: String

                public init(eventId: String) {
                    self.eventId = eventId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetEventsByEventId.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(eventId: String) {
                let options = Options(eventId: eventId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "eventId" + "}", with: "\(self.options.eventId)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = EventObject

            /// Event retrieved successfully 
            case status200(EventObject)

            /// Unauthorized 
            case status401

            /// Event not found 
            case status404

            public var success: EventObject? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status401: return 401
                case .status404: return 404
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status401: return false
                case .status404: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                switch statusCode {
                case 200: self = try .status200(decoder.decode(EventObject.self, from: data))
                case 401: self = .status401
                case 404: self = .status404
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
