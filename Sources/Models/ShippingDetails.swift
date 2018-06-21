import Foundation

public class ShippingDetails: Codable {

    public var addressLine1: String?

    public var addressLine2: String?

    public var city: String?

    public var country: String?

    public var phone: Phone?

    public var postCode: String?

    public var state: String?

    public init(addressLine1: String? = nil, addressLine2: String? = nil, city: String? = nil, country: String? = nil, phone: Phone? = nil, postCode: String? = nil, state: String? = nil) {
        self.addressLine1 = addressLine1
        self.addressLine2 = addressLine2
        self.city = city
        self.country = country
        self.phone = phone
        self.postCode = postCode
        self.state = state
    }

}
