import Foundation

extension API.Webhooks {

    /// Retrieves the webhooks configured for the channel identified by your API key
 
    public enum GetWebhooks {

        public static let service = APIService<Response>(id: "getWebhooks", tag: "Webhooks", method: "GET", path: "/webhooks", hasBody: false)

        public final class Request: APIRequest<Response> {

            public init() {
                super.init(service: GetWebhooks.service)
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = [Webhook]

            /// Configured webhooks 
            case status200([Webhook])

            /// No webhooks configured 
            case status204

            /// Unauthorized 
            case status401

            public var success: [Webhook]? {
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
                case .status204: return 204
                case .status401: return 401
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status204: return true
                case .status401: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                switch statusCode {
                case 200: self = try .status200(decoder.decode([Webhook].self, from: data))
                case 204: self = .status204
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
