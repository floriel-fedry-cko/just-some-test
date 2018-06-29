import Foundation

extension API.Webhooks {

    public enum DeleteWebhooksById {

        public static let service = APIService<Response>(id: "deleteWebhooksById", tag: "Webhooks", method: "DELETE", path: "/webhooks/{id}", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /// The webhook identifier, for example `wh_387ac7a83a054e37ae140105429d76b5`
 
                public var id: String

                public init(id: String) {
                    self.id = id
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: DeleteWebhooksById.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(id: String) {
                let options = Options(id: id)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void

            /// Webhook removed successfully 
            case status204

            /// Unauthorized 
            case status401

            /// Webhook not found 
            case status404

            public var success: Void? {
                switch self {
                case .status204: return ()
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
                case .status204: return 204
                case .status401: return 401
                case .status404: return 404
                }
            }

            public var successful: Bool {
                switch self {
                case .status204: return true
                case .status401: return false
                case .status404: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 204: self = .status204
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
