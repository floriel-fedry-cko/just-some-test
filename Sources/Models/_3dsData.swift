import Foundation

public class _3dsData: Codable {

    /// Indicates whether or not the cardholder was authenticated
    ///  * `Y` - Customer authenticated
    ///  * `N` - Customer not authenticated
    ///  * `A` - An authentication attempt occurred but could not be completed
    ///  * `U` - Unable to perform authentication
     
    public var authenticationResponse: String?

    /// Cryptographic identifier used by the card schemes to validate the integrity of the 3D secure payment data 
    public var cavv: String?

    /// Inidicates whether this was a 3D-Secure payment downgraded to Non-3D-Secure (when `attempt_n3d` is specified) 
    public var downgraded: Bool?

    /// Defines the E-Commerce Indicator security level associated with the payment 
    public var eci: String?

    /// Indicates the 3D-Secure enrollment status of the issuer
    ///  * `Y` - Issuer enrolled
    ///  * `N` - Customer not enrolled
    ///  * `U` - Unknown
     
    public var enrolled: String?

    /// Verification to ensure the integrity of the response. 
    public var signatureValid: String?

    /// Unique identifier for the transaction assigned by the MPI 
    public var xid: String?

    public init(authenticationResponse: String? = nil, cavv: String? = nil, downgraded: Bool? = nil, eci: String? = nil, enrolled: String? = nil, signatureValid: String? = nil, xid: String? = nil) {
        self.authenticationResponse = authenticationResponse
        self.cavv = cavv
        self.downgraded = downgraded
        self.eci = eci
        self.enrolled = enrolled
        self.signatureValid = signatureValid
        self.xid = xid
    }

}
