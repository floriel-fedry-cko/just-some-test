import Foundation

/** A phone number */
public class PhoneNumber: Codable {

    /** The international country calling code. Required for some risk checks. */
    public var countryCode: String?

    /** The phone number */
    public var number: String?

    public init(countryCode: String? = nil, number: String? = nil) {
        self.countryCode = countryCode
        self.number = number
    }

}
