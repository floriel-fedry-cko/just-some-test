import Foundation

public class ValidationError: Codable {

    public var errorCodes: [String]?

    public var errorType: String?

    public var requestId: String?

    public init(errorCodes: [String]? = nil, errorType: String? = nil, requestId: String? = nil) {
        self.errorCodes = errorCodes
        self.errorType = errorType
        self.requestId = requestId
    }

}
