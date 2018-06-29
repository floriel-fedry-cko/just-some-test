import Foundation

public class NotificationAttempt: Codable {

    /// Whether the notification was sent automatically or requested manually 
    public enum RetryMode: String, Codable {
        case automatic = "Automatic"
        case manual = "Manual"

        public static let cases: [RetryMode] = [
          .automatic,
          .manual,
        ]
    }

    /// The response body returned from the target server 
    public var responseBody: String?

    /// Whether the notification was sent automatically or requested manually 
    public var retryMode: RetryMode?

    /// The HTTP status code returned from the target server 
    public var statusCode: Int?

    /// The date/time the attempt was made 
    public var timestamp: String?

    public init(responseBody: String? = nil, retryMode: RetryMode? = nil, statusCode: Int? = nil, timestamp: String? = nil) {
        self.responseBody = responseBody
        self.retryMode = retryMode
        self.statusCode = statusCode
        self.timestamp = timestamp
    }

}
