import Foundation

extension API.Events {

    /// Retries a specific webhook notification for the given event 
    public enum PostEventsByEventIdWebhooksByWebhookIdRetry {

        public static let service = APIService<Response>(id: "postEventsByEventIdWebhooksByWebhookIdRetry", tag: "Events", method: "POST", path: "/events/{eventId}/webhooks/{webhookId}/retry", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /// The event identifier 
                public var eventId: String

                /// The webhook identifier 
                public var webhookId: String

                public init(eventId: String, webhookId: String) {
                    self.eventId = eventId
                    self.webhookId = webhookId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: PostEventsByEventIdWebhooksByWebhookIdRetry.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(eventId: String, webhookId: String) {
                let options = Options(eventId: eventId, webhookId: webhookId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "eventId" + "}", with: "\(self.options.eventId)").replacingOccurrences(of: "{" + "webhookId" + "}", with: "\(self.options.webhookId)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /// Retry accepted 
            case status202

            /// Unauthorized 
            case status401

            /// Event or webhook not found 
            case status404

            public var success: Void? {
                switch self {
                case .status202: return ()
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status202: return 202
                case .status401: return 401
                case .status404: return 404
                }
            }

            public var successful: Bool {
                switch self {
                case .status202: return true
                case .status401: return false
                case .status404: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 202: self = .status202
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
