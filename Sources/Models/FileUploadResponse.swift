import Foundation

public class FileUploadResponse: Codable {

    /// The unique identifier of the file uploaded 
    public var id: String

    /// The links related to the file 
    public var links: Links

    public class Links: Codable {

        /// The URI of the file uploaded. Use this to retrieve detailed file information 
        public var `self`: [String: String]

        public init(`sel`: [String: String]) {
            self.`self` = `sel`
        }

    }

    public init(id: String, links: Links) {
        self.id = id
        self.links = links
    }

}
