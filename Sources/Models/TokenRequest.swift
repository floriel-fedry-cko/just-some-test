import Foundation

/** The source of the payment */
public class TokenRequest: Codable {

    /** The type of card details to be tokenized */
    public var type: String

    public init(type: String) {
        self.type = type
    }

}
