import Foundation

/// Payment source 
public class PaymentSource: Codable {

    /// The card category 
    public enum CardCategory: String, Codable {
        case consumer = "Consumer"
        case commercial = "Commercial"

        public static let cases: [CardCategory] = [
          .consumer,
          .commercial,
        ]
    }

    /// The card type 
    public enum CardType: String, Codable {
        case credit = "Credit"
        case debit = "Debit"
        case prepaid = "Prepaid"

        public static let cases: [CardType] = [
          .credit,
          .debit,
          .prepaid,
        ]
    }

    /// The payment source identifier. Can be used for subsequent payments 
    public var id: String

    /// The type of payment source 
    public var type: String

    /// The Address Verification System check result 
    public var avsCheck: String?

    /// The payment source owner's billing address 
    public var billingAddress: String?

    /// The card issuer BIN 
    public var bin: String?

    /// The card category 
    public var cardCategory: CardCategory?

    /// The card type 
    public var cardType: CardType?

    /// The CVV check result 
    public var cvvCheck: String?

    /// The two-digit expiry month 
    public var expiryMonth: Int?

    /// The four-digit expiry year 
    public var expiryYear: Int?

    /// Uniquely identifies this particular card number. You can use this to compare cards across customers 
    public var fingerprint: String?

    /// The name of the card issuer 
    public var issuer: String?

    /// The card issuer country ISO-2 code 
    public var issuerCountry: String?

    /// The last four digits of the card number 
    public var last4: String?

    /// The card-holder name 
    public var name: String?

    /// The payment source owner's phone number 
    public var phone: String?

    /// The issuer/card scheme product identifier 
    public var productId: String?

    /// The issuer/card scheme product type 
    public var productType: String?

    /// The card scheme 
    public var scheme: String?

    public init(id: String, type: String, avsCheck: String? = nil, billingAddress: String? = nil, bin: String? = nil,
                cardCategory: CardCategory? = nil, cardType: CardType? = nil, cvvCheck: String? = nil,
                expiryMonth: Int? = nil, expiryYear: Int? = nil, fingerprint: String? = nil, issuer: String? = nil,
                issuerCountry: String? = nil, last4: String? = nil, name: String? = nil, phone: String? = nil,
                productId: String? = nil, productType: String? = nil, scheme: String? = nil) {
        self.id = id
        self.type = type
        self.avsCheck = avsCheck
        self.billingAddress = billingAddress
        self.bin = bin
        self.cardCategory = cardCategory
        self.cardType = cardType
        self.cvvCheck = cvvCheck
        self.expiryMonth = expiryMonth
        self.expiryYear = expiryYear
        self.fingerprint = fingerprint
        self.issuer = issuer
        self.issuerCountry = issuerCountry
        self.last4 = last4
        self.name = name
        self.phone = phone
        self.productId = productId
        self.productType = productType
        self.scheme = scheme
    }

}
