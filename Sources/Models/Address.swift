import Foundation

public class Address: Codable {

    /// Line 1 of the address
    public var addressLine1: String?

    /// Line 2 of the address
    public var addressLine2: String?

    /// The address city
    public var city: String?

    /// The two-letter ISO code of the address country
    public var country: String?

    /// The address state
    public var state: String?

    /// The address zip/postal code
    public var zip: String?

    public init(addressLine1: String? = nil, addressLine2: String? = nil, city: String? = nil, country: String? = nil, state: String? = nil, zip: String? = nil) {
        self.addressLine1 = addressLine1
        self.addressLine2 = addressLine2
        self.city = city
        self.country = country
        self.state = state
        self.zip = zip
    }

}
