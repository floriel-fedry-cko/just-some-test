import Foundation

public class VoidRequest: Codable {

    /// Set of key/value pairs that you can attach to the void request. It can be useful for storing additional information in a structured format 
    public var metadata: [String: String]?

    /// A reference you can later use to identify this void request 
    public var reference: String?

    public init(metadata: [String: String]? = nil, reference: String? = nil) {
        self.metadata = metadata
        self.reference = reference
    }

}
