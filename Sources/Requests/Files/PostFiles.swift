import Foundation

extension API.Files {

    /// Upload a file so that it can be used by other APIs, e.g. submit dispute evidence. 
    /// The file requirements (type/size) differ depending on the file `purpose`.
         
    public enum PostFiles {

        public static let service = APIService<Response>(id: "postFiles", tag: "Files", method: "POST", path: "/files", hasBody: true)

        /// The purpose of the file upload 
        public enum Purpose: String, Codable {
            case disputeEvidence = "dispute_evidence"
            case onboardingDocument = "onboarding_document"
            case batchProcessing = "batch_processing"

            public static let cases: [Purpose] = [
              .disputeEvidence,
              .onboardingDocument,
              .batchProcessing,
            ]
        }

        public final class Request: APIRequest<Response> {

            public struct Options {

                /// The file to upload 
                public var file: URL

                /// The purpose of the file upload 
                public var purpose: Purpose

                public init(file: URL, purpose: Purpose) {
                    self.file = file
                    self.purpose = purpose
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: PostFiles.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(file: URL, purpose: Purpose) {
                let options = Options(file: file, purpose: purpose)
                self.init(options: options)
            }

        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = FileUploadResponse

            /// File uploaded successfully 
            case status201(FileUploadResponse)

            /// Unauthorized 
            case status401

            /// Invalid data was sent 
            case status422(ValidationError)

            public var success: FileUploadResponse? {
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
            public var responseResult: APIResponseResult<FileUploadResponse, ValidationError> {
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
                case 201: self = try .status201(decoder.decode(FileUploadResponse.self, from: data))
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
