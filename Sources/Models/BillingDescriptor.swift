import Foundation

/** An optional dynamic billing descriptor displayed on the account owner's statement. [Read more](https://docs.checkout.com/reference/merchant-api-reference/complex-request-objects/dynamic-descriptor)
 */
public class BillingDescriptor: Codable {

    /** Dynamic description of the charge */
    public var name: String

    /** City where the charge originated */
    public var city: String

    public init(name: String, city: String) {
        self.name = name
        self.city = city
    }

}
