import Foundation

public class _3dsEnrollmentData: Codable {

    /// Inidicates whether this was a 3D-Secure payment downgraded to Non-3D-Secure (when `attempt_n3d` is specified) 
    public var downgraded: Bool?

    /// Indicates the 3D-Secure enrollment status of the issuer
    ///  * `Y` - Issuer enrolled
    ///  * `N` - Customer not enrolled
    ///  * `U` - Unknown
     
    public var enrolled: String?

    public init(downgraded: Bool? = nil, enrolled: String? = nil) {
        self.downgraded = downgraded
        self.enrolled = enrolled
    }

}
