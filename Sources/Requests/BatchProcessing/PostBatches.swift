import Foundation

extension API.BatchProcessing {

    /// Submit a batch file for processing.
 
    public enum PostBatches {

        public static let service = APIService<Response>(id: "postBatches", tag: "Batch Processing", method: "POST", path: "/batches", hasBody: true)

        public final class Request: APIRequest<Response> {

            public var body: SubmitBatchRequest

            public init(body: SubmitBatchRequest) {
                self.body = body
                super.init(service: PostBatches.service) {
                    let jsonEncoder = JSONEncoder()
                    return try jsonEncoder.encode(body)
                }
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SubmitBatchResponse

            /// Batch submitted for processing 
            case status202(SubmitBatchResponse)

            /// Unauthorized 
            case status401

            /// Invalid data was sent 
            case status422(ValidationError)

            public var success: SubmitBatchResponse? {
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
            public var responseResult: APIResponseResult<SubmitBatchResponse, ValidationError> {
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
                case .status422: return 422
                }
            }

            public var successful: Bool {
                switch self {
                case .status202: return true
                case .status401: return false
                case .status422: return false
                }
            }

            public init(statusCode: Int, data: Data) throws {
                let decoder = JSONDecoder()
                switch statusCode {
                case 202: self = try .status202(decoder.decode(SubmitBatchResponse.self, from: data))
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
