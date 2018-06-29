import Foundation

extension API.Payments {

    /// Returns the details of the payment with the specified identifier string.
    ///
    /// If the payment method requires a redirection to a third party (e.g. 3D-Secure), 
    /// the redirect URL back to your site will include a `cko-session-id` query parameter 
    /// containing a payment session ID that can be used to obtain the details of the payment, for example:

    /// http://example.com/success?cko-session-id=sid_ubfj2q76miwundwlk72vxt2i7q.
 
    public enum GetPaymentsById {

        public static let service = APIService<Response>(id: "getPaymentsById", tag: "Payments", method: "GET", path: "/payments/{id}", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /// The payment or payment session identifier 
                public var id: String

                public init(id: String) {
                    self.id = id
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetPaymentsById.service)
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
            public typealias SuccessType = Payment

            /// Payment retrieved successfully 
            case status200(Payment)

            /// Unauthorized 
            case status401

            /// Payment not found 
            case status404

            public var success: Payment? {
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
                case 200: self = try .status200(decoder.decode(Payment.self, from: data))
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
