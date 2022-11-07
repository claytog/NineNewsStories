import Foundation

typealias Articles = [Asset]

// MARK: - Welcome
struct Article: Codable {
    let id: Int
    let categories: [JSONAny]
    let authors: [JSONAny]
    let url: String
    let lastModified: Int
    let onTime: Int?
    let sponsored: Bool
    let displayName: String?
    let assets: [Asset]?
    let relatedAssets: [JSONAny]
    let relatedImages: [JSONAny]
    let assetType: String
    let timeStamp: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case categories = "categories"
        case authors = "authors"
        case url = "url"
        case lastModified = "lastModified"
        case onTime = "onTime"
        case sponsored = "sponsored"
        case displayName = "displayName"
        case assets = "assets"
        case relatedAssets = "relatedAssets"
        case relatedImages = "relatedImages"
        case assetType = "assetType"
        case timeStamp = "timeStamp"
    }
}

// MARK: - Asset
struct Asset: Codable {
    let id: Int?
    let categories: [Category]?
    let authors: [Author]?
    let url: String
    let lastModified: Int
    let sponsored: Bool
    let headline: String
    let indexHeadline: String
    let tabletHeadline: String
    let theAbstract: String
    let byLine: String
    let acceptComments: Bool
    let numberOfComments: Int
    let relatedAssets: [RelatedAsset]
    let relatedImages: [AssetRelatedImage]
    let signPost: String?
    let companies: [Company]?
    let legalStatus: String?
    let sources: [Source]?
    let assetType: String?
    let overrides: Overrides?
    let timeStamp: Int?
    let onTime: Int??
    let identifier: String?

    var thumbnail: AssetRelatedImage { // return the smallest image (based on width)
        let sortedByWidth = relatedImages.sorted(by: { $0.width < $1.width })
        return sortedByWidth[0]
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case categories = "categories"
        case authors = "authors"
        case url = "url"
        case lastModified = "lastModified"
        case sponsored = "sponsored"
        case headline = "headline"
        case indexHeadline = "indexHeadline"
        case tabletHeadline = "tabletHeadline"
        case theAbstract = "theAbstract"
        case byLine = "byLine"
        case acceptComments = "acceptComments"
        case numberOfComments = "numberOfComments"
        case relatedAssets = "relatedAssets"
        case relatedImages = "relatedImages"
        case signPost = "signPost"
        case companies = "companies"
        case legalStatus = "legalStatus"
        case sources = "sources"
        case assetType = "assetType"
        case overrides = "overrides"
        case timeStamp = "timeStamp"
        case onTime = "onTime"
        case identifier = "identifier"
    }
}

// MARK: - Author
struct Author: Codable {
    let name: String
    let title: String
    let email: String
    let relatedAssets: [JSONAny]
    let relatedImages: [AuthorRelatedImage]

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case title = "title"
        case email = "email"
        case relatedAssets = "relatedAssets"
        case relatedImages = "relatedImages"
    }
}

// MARK: - AuthorRelatedImage
struct AuthorRelatedImage: Codable {
    let id: Int
    let categories: [JSONAny]
    let brands: [JSONAny]
    let authors: [JSONAny]
    let url: String
    let lastModified: Int
    let sponsored: Bool
    let relatedImageDescription: String
    let photographer: String
    let type: String
    let width: Int
    let height: Int
    let assetType: String
    let timeStamp: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case categories = "categories"
        case brands = "brands"
        case authors = "authors"
        case url = "url"
        case lastModified = "lastModified"
        case sponsored = "sponsored"
        case relatedImageDescription = "description"
        case photographer = "photographer"
        case type = "type"
        case width = "width"
        case height = "height"
        case assetType = "assetType"
        case timeStamp = "timeStamp"
    }
}

// MARK: - Category
struct Category: Codable {
    let name: String
    let sectionPath: String
    let orderNum: Int

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case sectionPath = "sectionPath"
        case orderNum = "orderNum"
    }
}

// MARK: - Company
struct Company: Codable {
    let id: Int
    let companyCode: String
    let companyName: String
    let abbreviatedName: String
    let exchange: String
    let companyNumber: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case companyCode = "companyCode"
        case companyName = "companyName"
        case abbreviatedName = "abbreviatedName"
        case exchange = "exchange"
        case companyNumber = "companyNumber"
    }
}

// MARK: - Overrides
struct Overrides: Codable {
    let overrideHeadline: String
    let overrideAbstract: String
    let overrideIdentifier: String?

    enum CodingKeys: String, CodingKey {
        case overrideHeadline = "overrideHeadline"
        case overrideAbstract = "overrideAbstract"
        case overrideIdentifier = "overrideIdentifier"
    }
}

// MARK: - RelatedAsset
struct RelatedAsset: Codable {
    let id: Int
    let categories: [Category]
    let authors: [Author]
    let url: String
    let lastModified: Int
    let sponsored: Bool
    let assetType: String
    let headline: String
    let timeStamp: Int
    let onTime: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case categories = "categories"
        case authors = "authors"
        case url = "url"
        case lastModified = "lastModified"
        case sponsored = "sponsored"
        case assetType = "assetType"
        case headline = "headline"
        case timeStamp = "timeStamp"
        case onTime = "onTime"
    }
}

// MARK: - AssetRelatedImage
struct AssetRelatedImage: Codable {
    let id: Int
    let categories: [JSONAny]
    let brands: [JSONAny]
    let authors: [JSONAny]
    let url: String
    let lastModified: Int
    let sponsored: Bool
    let relatedImageDescription: String
    let photographer: String
    let type: String
    let width: Int
    let height: Int
    let assetType: String
    let xLarge2X: String?
    let xLarge: String?
    let large2X: String?
    let large: String?
    let thumbnail2X: String?
    let thumbnail: String?
    let timeStamp: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case categories = "categories"
        case brands = "brands"
        case authors = "authors"
        case url = "url"
        case lastModified = "lastModified"
        case sponsored = "sponsored"
        case relatedImageDescription = "description"
        case photographer = "photographer"
        case type = "type"
        case width = "width"
        case height = "height"
        case assetType = "assetType"
        case xLarge2X = "xLarge@2x"
        case xLarge = "xLarge"
        case large2X = "large@2x"
        case large = "large"
        case thumbnail2X = "thumbnail@2x"
        case thumbnail = "thumbnail"
        case timeStamp = "timeStamp"
    }
}

// MARK: - Source
struct Source: Codable {
    let tagId: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}


