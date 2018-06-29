import Foundation

/// The batch request 
public class SubmitBatchRequest: Codable {

    /// The action to be performed against the batch 
    public enum Action: String, Codable {
        case payment = "payment"

        public static let cases: [Action] = [
          .payment,
        ]
    }

    /// The identifier of the batch file previously uploaded via the [Files API](#tag/Files) 
    public var fileId: String

    /// The action to be performed against the batch 
    public var action: Action

    /// Your reference for the batch. If provided, this will be validated against the batch file's header. 
    public var reference: String?

    public init(fileId: String, action: Action, reference: String? = nil) {
        self.fileId = fileId
        self.action = action
        self.reference = reference
    }

}
