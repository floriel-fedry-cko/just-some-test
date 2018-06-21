import Foundation

extension API.Events {

    /** Retrieves events ordered by the event date in descending order (latest first). Results can be paged by specifying the `skip` and `limit` query parameters. */
    public enum GetEvents {

        public static let service = APIService<Response>(id: "getEvents", tag: "Events", method: "GET", path: "/events", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** An ISO8601 formatted date and time to search from (default = last 6 months) */
                public var from: DateTime?

                /** An ISO8601 formatted date and time to search to (default = now) */
                public var to: DateTime?

                /** The number of events to return per page */
                public var limit: Int?

                /** The number of events to skip */
                public var skip: Int?

                public init(from: DateTime? = nil, to: DateTime? = nil, limit: Int? = nil, skip: Int? = nil) {
                    self.from = from
                    self.to = to
                    self.limit = limit
                    self.skip = skip
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetEvents.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(from: DateTime? = nil, to: DateTime? = nil, limit: Int? = nil, skip: Int? = nil) {
                let options = Options(from: from, to: to, limit: limit, skip: skip)
                self.init(options: options)
            }

        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = EventResult

            /** Events retrieved successfully */
            case status200(EventResult)

            /** No events found */
            case status204

            /** Unauthorized */
            case status401

            /** Invalid data was sent */
            case status422(ValidationError)

            public var success: EventResult? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ValidationError? {
                switch self {
                case .status422(let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<EventResult, ValidationError> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status422(let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status204: return 204
                case .status401: return 401
                case .status422: return 422
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status204: return true
                case .status401: return false
                case .status422: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                switch statusCode {
                case 200: self = try .status200(decoder.decode(EventResult.self, from: data))
                case 204: self = .status204
                case 401: self = .status401
                case 422: self = try .status422(decoder.decode(ValidationError.self, from: data))
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
