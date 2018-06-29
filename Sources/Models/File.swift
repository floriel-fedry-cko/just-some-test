import Foundation

public class File: Codable {

    /// The file identifier 
    public var id: String

    /// The file name 
    public var filename: String

    /// The purpose of the uploaded file 
    public var purpose: String

    /// The size in bytes of the file upload object 
    public var size: Double

    /// File upload date and time in UTC 
    public var uploadedOn: String

    public var links: Links

    public class Links: Codable {

        /// The file information retrieval URL 
        public var `self`: [String: String]

        /// The temporary file download URL. The URL expires after a certain time period 
        public var download: [String: String]

        public init(`sel`: [String: String], download: [String: String]) {
            self.`self` = `sel`
            self.download = download
        }

    }

    public init(id: String, filename: String, purpose: String, size: Double, uploadedOn: String, links: Links) {
        self.id = id
        self.filename = filename
        self.purpose = purpose
        self.size = size
        self.uploadedOn = uploadedOn
        self.links = links
    }

}
