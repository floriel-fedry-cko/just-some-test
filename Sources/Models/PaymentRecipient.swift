import Foundation

/** Required by VISA and MasterCard for domestic UK transactions processed by Financial Institutions. [Read more](https://docs.checkout.com/reference/merchant-api-reference/complex-request-objects/visa-requirements-for-financial-institutions) */
public class PaymentRecipient: Codable {

    /** The recipient's date of birth in yyyy-mm-dd format */
    public var dob: DateDay

    /** The first six digits and the last four digits of the primary recipient's card, without spaces, or, up to ten characters of the primary recipient's account number */
    public var accountNumber: String

    /** The first part of the UK postcode for example W1T 4TJ would be W1T */
    public var zip: String

    /** The last name of the recipient */
    public var lastName: String

    public init(dob: DateDay, accountNumber: String, zip: String, lastName: String) {
        self.dob = dob
        self.accountNumber = accountNumber
        self.zip = zip
        self.lastName = lastName
    }

}
