import Foundation

public class Phone: Codable {

    public var countryCode: String?

    public var number: String?

    public init(countryCode: String? = nil, number: String? = nil) {
        self.countryCode = countryCode
        self.number = number
    }

}
