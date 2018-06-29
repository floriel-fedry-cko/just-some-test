import Foundation

extension API.Payments {

    /// Captures a payment if supported by the payment method. 
    ///
    /// For card payments, capture requests are processed asynchronously. You can use [webhooks](#tag/Webhooks) to be notified if the capture is successful.
 
    public enum PostPaymentsByIdCaptures {

        public static let service = APIService<Response>(id: "postPaymentsByIdCaptures", tag: "Payments", method: "POST", path: "/payments/{id}/captures", hasBody: true)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /// The payment identifier 
                public var id: String

                public init(id: String) {
                    self.id = id
                }
            }

            public var options: Options

            public var body: CaptureRequest

            public init(body: CaptureRequest, options: Options) {
                self.body = body
                self.options = options
                super.init(service: PostPaymentsByIdCaptures.service) {
                    let jsonEncoder = JSONEncoder()
                    return try jsonEncoder.encode(body)
                }
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(id: String, body: CaptureRequest) {
                let options = Options(id: id)
                self.init(body: body, options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = CaptureAcceptedResponse

            /// Capture accepted 
            case status202(CaptureAcceptedResponse)

            /// Unauthorized 
            case status401

            /// Capture not allowed 
            case status403

            /// Payment not found 
            case status404

            /// Invalid data was sent 
            case status422(ValidationError)

            /// Bad gateway 
            case status502

            public var success: CaptureAcceptedResponse? {
                switch self {
                case .status202(let response): return response
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
            public var responseResult: APIResponseResult<CaptureAcceptedResponse, ValidationError> {
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
                case .status202(let response): return response
                case .status422(let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status202: return 202
                case .status401: return 401
                case .status403: return 403
                case .status404: return 404
                case .status422: return 422
                case .status502: return 502
                }
            }

            public var successful: Bool {
                switch self {
                case .status202: return true
                case .status401: return false
                case .status403: return false
                case .status404: return false
                case .status422: return false
                case .status502: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                switch statusCode {
                case 202: self = try .status202(decoder.decode(CaptureAcceptedResponse.self, from: data))
                case 401: self = .status401
                case 403: self = .status403
                case 404: self = .status404
                case 422: self = try .status422(decoder.decode(ValidationError.self, from: data))
                case 502: self = .status502
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
