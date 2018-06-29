import Foundation

extension API.Events {

    /// Retrieve a list of event types grouped by their respective version that you can configure on your webhooks 
    public enum GetEventTypes {

        public static let service = APIService<Response>(id: "getEventTypes", tag: "Events", method: "GET", path: "/event-types", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /// The events version 
                public var version: String

                public init(version: String) {
                    self.version = version
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetEventTypes.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(version: String) {
                let options = Options(version: version)
                self.init(options: options)
            }

            public override var parameters: [String: String]{
                var params: [String: String] = [:]
                params["version"] = options.version
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [EventTypesObject]

            /// Event types retrieved successfully 
            case status200([EventTypesObject])

            /// Unauthorized 
            case status401

            public var success: [EventTypesObject]? {
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
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status401: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                switch statusCode {
                case 200: self = try .status200(decoder.decode([EventTypesObject].self, from: data))
                case 401: self = .status401
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
