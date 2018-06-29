import Foundation

extension API.Sources {

    /// Add a reusable payment sources that can be later used to make one or more payments. 
    /// Payment sources are linked to a specific customer and cannot be shared between customers.
 
    public enum PostSources {

        public static let service = APIService<Response>(id: "postSources", tag: "Sources", method: "POST", path: "/sources", hasBody: true)

        public final class Request: APIRequest<Response> {

            public var body: SourceRequest

            public init(body: SourceRequest) {
                self.body = body
                super.init(service: PostSources.service) {
                    let jsonEncoder = JSONEncoder()
                    return try jsonEncoder.encode(body)
                }
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = AddSourceResponse

            /// Payment source added successfully 
            case status201(AddSourceResponse)

            /// Payment source asynchronous or further action required 
            case status202(SourceRedirectResponse)

            /// Unauthorized 
            case status401

            /// Invalid data was sent 
            case status422(ValidationError)

            /// Bad gateway 
            case status502

            public var success: AddSourceResponse? {
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
            public var responseResult: APIResponseResult<AddSourceResponse, ValidationError> {
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
                case .status202(let response): return response
                case .status422(let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status201: return 201
                case .status202: return 202
                case .status401: return 401
                case .status422: return 422
                case .status502: return 502
                }
            }

            public var successful: Bool {
                switch self {
                case .status201: return true
                case .status202: return true
                case .status401: return false
                case .status422: return false
                case .status502: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                switch statusCode {
                case 201: self = try .status201(decoder.decode(AddSourceResponse.self, from: data))
                case 202: self = try .status202(decoder.decode(SourceRedirectResponse.self, from: data))
                case 401: self = .status401
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
