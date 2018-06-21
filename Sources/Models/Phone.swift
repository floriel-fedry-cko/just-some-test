//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Phone: Codable {

    public var countryCode: String?

    public var number: String?

    public init(countryCode: String? = nil, number: String? = nil) {
        self.countryCode = countryCode
        self.number = number
    }

    private enum CodingKeys: String, CodingKey {
        case countryCode = "country_code"
        case number
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        countryCode = try container.decodeIfPresent(.countryCode)
        number = try container.decodeIfPresent(.number)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(countryCode, forKey: .countryCode)
        try container.encodeIfPresent(number, forKey: .number)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Phone else { return false }
      guard self.countryCode == object.countryCode else { return false }
      guard self.number == object.number else { return false }
      return true
    }

    public static func == (lhs: Phone, rhs: Phone) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
