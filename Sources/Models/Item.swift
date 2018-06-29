import Foundation

/// The order line item or product that is being purchased 
public class Item: Codable {

    /// A description of the item or product 
    public var description: String?

    /// The URL of an image of the item or product 
    public var imageUrl: URL?

    /// The name of the item or product 
    public var name: String?

    /// The unit price of the item or product in the minor currency unit 
    public var price: Double?

    /// The number of the items purchased 
    public var quantity: Double?

    /// The shipping cost of the item 
    public var shippingCost: Double?

    /// A URL to track the shipping status of the item 
    public var shippingTrackingUrl: URL?

    /// The stock-keeping unit identifier of the item 
    public var sku: String?

    public init(description: String? = nil, imageUrl: URL? = nil, name: String? = nil, price: Double? = nil, quantity: Double? = nil, shippingCost: Double? = nil, shippingTrackingUrl: URL? = nil, sku: String? = nil) {
        self.description = description
        self.imageUrl = imageUrl
        self.name = name
        self.price = price
        self.quantity = quantity
        self.shippingCost = shippingCost
        self.shippingTrackingUrl = shippingTrackingUrl
        self.sku = sku
    }

}
