import Foundation

extension API.Payments {

    /// Returns all the actions associated with a payment ordered by processing date in descending order (latest first).
 
    public enum GetPaymentsByIdActions {

        public static let service = APIService<Response>(id: "getPaymentsByIdActions", tag: "Payments", method: "GET", path: "/payments/{id}/actions", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /// The payment identifier 
                public var id: String

                public init(id: String) {
                    self.id = id
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetPaymentsByIdActions.service)
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
            public typealias SuccessType = PaymentActionsResponse

            /// Payment actions retrieved successfully 
            case status200(PaymentActionsResponse)

            /// Unauthorized 
            case status401

            /// Payment not found 
            case status404

            public var success: PaymentActionsResponse? {
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
                case 200: self = try .status200(decoder.decode(PaymentActionsResponse.self, from: data))
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
