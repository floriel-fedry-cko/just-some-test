import Foundation

extension API.Tokens {

    /// Exchange card details or a digital wallet payment token for a reference token that can be later used to request a card payment. 
    ///
    /// **To create tokens please authenticate using your public key**
 
    public enum PostTokens {

        public static let service = APIService<Response>(id: "postTokens", tag: "Tokens", method: "POST", path: "/tokens", hasBody: true)

        public final class Request: APIRequest<Response> {

            public var body: TokenRequest

            public init(body: TokenRequest) {
                self.body = body
                super.init(service: PostTokens.service) {
                    let jsonEncoder = JSONEncoder()
                    return try jsonEncoder.encode(body)
                }
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = TokenResponse

            /// Reference token created successfully 
            case status201(TokenResponse)

            /// Unauthorized 
            case status401

            /// Invalid data was sent 
            case status422(ValidationError)

            public var success: TokenResponse? {
                switch self {
                case .status201(let response): return response
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
            public var responseResult: APIResponseResult<TokenResponse, ValidationError> {
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
                case .status201(let response): return response
                case .status422(let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status201: return 201
                case .status401: return 401
                case .status422: return 422
                }
            }

            public var successful: Bool {
                switch self {
                case .status201: return true
                case .status401: return false
                case .status422: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                switch statusCode {
                case 201: self = try .status201(decoder.decode(TokenResponse.self, from: data))
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
