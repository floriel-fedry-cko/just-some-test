import Foundation

public class Product: Codable {

    public var description: String?

    public var image: String?

    public var name: String?

    public var price: Int?

    public var quantity: Int?

    public var shippingCost: Int?

    public var sku: String?

    public var trackingUrl: String?

    public init(description: String? = nil, image: String? = nil, name: String? = nil, price: Int? = nil,
                quantity: Int? = nil, shippingCost: Int? = nil, sku: String? = nil, trackingUrl: String? = nil) {
        self.description = description
        self.image = image
        self.name = name
        self.price = price
        self.quantity = quantity
        self.shippingCost = shippingCost
        self.sku = sku
        self.trackingUrl = trackingUrl
    }

}
