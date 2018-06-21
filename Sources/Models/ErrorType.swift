import Foundation

public class ErrorType: Codable {

    public var errorType: String?

    public var requestId: String?

    public init(errorType: String? = nil, requestId: String? = nil) {
        self.errorType = errorType
        self.requestId = requestId
    }

}
