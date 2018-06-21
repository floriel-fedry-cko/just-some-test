import Foundation

/** # Introduction
The Checkout.com API is built on HTTP. Our API is RESTful. It has predictable resource URLs.  It returns HTTP response codes to indicate errors.  It also accepts and returns JSON in the HTTP body.

You can use your favorite HTTP/REST library for your programming language to use Checkout's API, or you can use one of our SDKs (currently available in [PHP](https://github.com/checkout/checkout-php-library), [.NET](https://github.com/checkout/checkout-net-library) and [Java](https://github.com/checkout/checkout-java-library)).
# Authentication
When you sign up for an account, you are given a secret and public API key pair. You authenticate with the Checkout.com API by providing the appropriate key in the request Authorization header.

Never share your secret keys. Keep them guarded and secure.
<!-- ReDoc-Inject: <security-definitions> -->
 */
public struct API {

    /// Whether to discard any errors when decoding optional properties
    public static var safeOptionalDecoding = false

     /// Whether to remove invalid elements instead of throwing when decoding arrays
    public static var safeArrayDecoding = false

    public static let version = "1.0"

    public enum BatchProcessing {}
    public enum Events {}
    public enum Files {}
    public enum Payments {}
    public enum Sources {}
    public enum Tokens {}
    public enum Webhooks {}

}
