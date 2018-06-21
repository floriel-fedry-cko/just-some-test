import Foundation

/** The source of the payment */
public class TokenResponse: Codable {

    /** The type of card details to be tokenized */
    public var type: String

    /** The reference token */
    public var token: String

    /** The date/time the token will expire */
    public var expiresOn: String

    public init(type: String, token: String, expiresOn: String) {
        self.type = type
        self.token = token
        self.expiresOn = expiresOn
    }

}
