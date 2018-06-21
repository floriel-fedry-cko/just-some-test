import Foundation

public class InvalidError: ErrorType {

    public var details: [String]?

    public init(errorType: String? = nil, requestId: String? = nil, details: [String]? = nil) {
        self.details = details
        super.init(errorType: errorType, requestId: requestId)
    }
    
    public required init(from decoder: Decoder) throws {
        try! super.init(from: decoder)
    }

}
