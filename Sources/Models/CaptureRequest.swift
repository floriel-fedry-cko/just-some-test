import Foundation

public class CaptureRequest: Codable {

    /// The amount to capture in the major currency. If not specified, the full payment amount will be captured
    public var amount: Int?

    /// Set of key/value pairs that you can attach to the capture request. It can be useful for storing additional information in a structured format
    public var metadata: [String: String]?

    /// A reference you can later use to identify this capture request
    public var reference: String?

    public init(amount: Int? = nil, metadata: [String: String]? = nil, reference: String? = nil) {
        self.amount = amount
        self.metadata = metadata
        self.reference = reference
    }

}
