import Foundation

extension API.Webhooks {

    /// Updates an existing webhook
 
    public enum PutWebhooksById {

        public static let service = APIService<Response>(id: "putWebhooksById", tag: "Webhooks", method: "PUT", path: "/webhooks/{id}", hasBody: true)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /// The webhook identifier, for example `wh_387ac7a83a054e37ae140105429d76b5`
 
                public var id: String

                public init(id: String) {
                    self.id = id
                }
            }

            public var options: Options

            public var request: [String: String]

            public init(request: [String: String], options: Options) {
                self.request = request
                self.options = options
                super.init(service: PutWebhooksById.service, parameters: [:], headers: [:], encodeBody: nil)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(id: String, request: [String: String]) {
                let options = Options(id: id)
                self.init(request: request, options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Webhook

            /// Updated webhook 
            case status200(Webhook)

            /// Unauthorized 
            case status401

            /// Webhook not found 
            case status404

            /// Url already registered for another webhook 
            case status409

            /// Invalid data was sent 
            case status422(ValidationError)

            public var success: Webhook? {
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
            public var responseResult: APIResponseResult<Webhook, ValidationError> {
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
                case .status401: return 401
                case .status404: return 404
                case .status409: return 409
                case .status422: return 422
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status401: return false
                case .status404: return false
                case .status409: return false
                case .status422: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                switch statusCode {
                case 200: self = try .status200(decoder.decode(Webhook.self, from: data))
                case 401: self = .status401
                case 404: self = .status404
                case 409: self = .status409
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
