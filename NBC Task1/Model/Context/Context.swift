//
//  Context.swift
//  NBC Task1
//
//  Created by Tringapps on 26/05/22.
//

import Foundation

struct Context: Decodable {
    private enum CodingKeys: String, CodingKey {
        case apiVersion
        case context
        case generated
        case data
    }
    var apiVersion: String?
    var context: String?
    var generated: String?
    var data: ContextData?
}

struct ContextData: Decodable {
    private enum CodingKeys: String, CodingKey {
        case meta
        case items
    }
    var meta: ContextMeta?
    var items = [ContextItem]()
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([ContextArticle].self, forKey: .items)
    }
}

struct ContextMeta: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case slug
        case uri
        case url
        case path
    }
    var name: String?
    var slug: String?
    var uri: String?
    var url: String?
    var path: String?
}

struct ContextPublishedDate: Decodable {
    private enum CodingKeys: String, CodingKey {
        case date
        case string
    }
    var date: String?
    var string: String?
}

struct ContextUpdatedDate: Decodable {
    private enum CodingKeys: String, CodingKey {
        case date
        case string
    }
    var date: String?
    var string: String?
}

struct ContextAttributes: Decodable {
    private enum CodingKeys: String, CodingKey {
        case size
        case webLinkout
    }
    var size: String?
    var webLinkout: Bool?
    
//    var cardType: ContextCardType {
//        guard let size = size else {
//            return .none
//        }
//        return ContextCardType(rawValue: size)
//    }
}

struct ContextAssets: Decodable {
    private enum CodingKeys: String, CodingKey {
        case partnerBranding = "partner_branding"
        case categoryLogo = "category_logo_on_dark"
    }
    var partnerBranding: ContextPartnerBranding?
    var categoryLogo: String?
}

struct ContextPartnerBranding: Decodable{
    private enum CodingKeys: String, CodingKey {
        case brandingImageAlt = "branding_image_alt"
        case brandingImageUrl = "branding_image_url"
        case description
        case fromSisterStation = "from_sister_station"
    }
    var brandingImageAlt: String?
    var brandingImageUrl: String?
    var description: String?
    var fromSisterStation: Bool?
}

struct ContextEyebrow: Decodable{
    private enum CodingKeys: String, CodingKey {
        case link
        case label
        case uri
    }
    var link: String?
    var label: String?
    var uri: String?
}

struct ContextFeaturedImage: Decodable {
    private enum CodingKeys: String, CodingKey {
        case credit
        case caption
        case small
        case large
    }
    var credit: String?
    var caption: String?
    var small: String?
    var large: String?
}

struct ContextPrimaryCategory: Decodable {
    private enum CodingKeys: String, CodingKey {
        case itemId = "id"
        case name
        case slug
        case uri
    }
    var itemId: Int?
    var name: String?
    var slug: String?
    var uri: String?
}

struct ContextPrimaryTag: Decodable {
    private enum CodingKeys: String, CodingKey {
        case itemId = "id"
        case name
        case slug
        case uri
    }
    var itemId: Int?
    var name: String?
    var slug: String?
    var uri: String?
}

struct ContextSponsor: Decodable {
    private enum CodingKeys: String, CodingKey {
        case itemId = "id"
        case name
        case slug
        case type
        case dartUrl = "dart_url"
        case dartPixel = "dart_pixel"
        case linkOutName = "link_out_name"
        case linkOutUrl = "link_out_url"
        case sponsorId = "sponsor_id"
        case sponsorAdId = "sponsor_ad_id"
        case toHomePage = "to_homepage"
        case sponsorExpiration = "sponsor_expiration"
        case expired
    }
    var itemId: Int?
    var name: String?
    var slug: String?
    var type: String?
    var dartUrl: String?
    var dartPixel: String?
    var linkOutName: String?
    var linkOutUrl: String?
    var sponsorId: String?
    var sponsorAdId: String?
    var toHomePage: Bool?
    var sponsorExpiration: String?
    var expired: Bool?
}

struct ContextByline: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
    }
    var displayName: String?
}

struct ContextLeadVideo: Decodable {
    private enum CodingKeys: String, CodingKey {
        case uri
        case url
        case liveStream
    }
    var uri: String?
    var url: String?
    var liveStream: Bool?
}


protocol ContextBaseItem: Decodable {
    var kind: String? {get}
}
protocol ContextItem: ContextBaseItem {
    
    var id: Int? {get}
    var kind: String? {get}
    var title: String? {get}
    var subtitle: String? {get}
    var summary: String? {get}
    var dateString: String? {get}
    var publishedDate: ContextPublishedDate? {get}
    var updatedDate: ContextUpdatedDate? {get}
    var networkObjectID: String? {get}
    var uri: String? {get}
    var url: String? {get}
    var path: String? {get}
    var attributes: ContextAttributes? {get}
    var assets: ContextAssets? {get}
    var categories: [String?]? {get}
    var collections: [String?]? {get}
    var eyebrow: ContextEyebrow? {get}
    var featuredImage: ContextFeaturedImage? {get}
    var primaryCategory: ContextPrimaryCategory? {get}
    var primaryTag: ContextPrimaryTag? { get }
    var sponsor: ContextSponsor? {get}
    var tags: [String?]? {get}
    var byline: [ContextByline]? {get}
    var originatingMarket: String? {get}
    var contentSource: String? {get}
    var nationalized: Bool? {get}
    var syndicateID: String? {get}
    var localID: String? {get}
    var leadVideo: ContextLeadVideo? {get}
    var urlParams: String? {get}
}

struct ContextArticle: Decodable, ContextItem {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case kind
        case title
        case subtitle
        case summary
        case dateString
        case publishedDate
        case updatedDate
        case networkObjectID
        case uri
        case url
        case path
        case attributes
        case assets
        case categories
        case collections
        case eyebrow
        case featuredImage
        case primaryCategory
        case primaryTag
        case sponsor
        case tags
        case byline
        case contentSource
        case nationalized
        case localID
        case leadVideo
        case urlParams
    }
    
    var id: Int?
    var kind: String?
    var title: String?
    var subtitle: String?
    var summary: String?
    var dateString: String?
    var publishedDate: ContextPublishedDate?
    var updatedDate: ContextUpdatedDate?
    var networkObjectID: String?
    var uri: String?
    var url: String?
    var path: String?
    var attributes: ContextAttributes?
    var assets: ContextAssets?
    var categories: [String?]?
    var collections: [String?]?
    var eyebrow: ContextEyebrow?
    var featuredImage: ContextFeaturedImage?
    var primaryCategory: ContextPrimaryCategory?
    var primaryTag: ContextPrimaryTag?
    var sponsor: ContextSponsor?
    var tags: [String?]?
    var byline: [ContextByline]?
    var originatingMarket: String?
    var contentSource: String?
    var nationalized: Bool?
    var syndicateID: String?
    var localID: String?
    var leadVideo: ContextLeadVideo?
    var urlParams: String?
}

//MARK: Context Post
struct ContextPost: ContextItem {
    
    private enum CodingKeys: String, CodingKey {
        case kind
        case id
        case uri
        case dateString
        case publishedDate
        case updatedDate
        case title
        case subtitle
        case summary
        case url
        case path
        case urlParams
        case attributes
        case assets
        case featuredImage
        case categories
        case collections
        case tags
        case byline
        case primaryCategory
        case eyebrow
        case primaryTag
        case sponsor
        case leadVideo
        case smil
        
        case originatingMarket
        case contentSource
        case nationalized
        case syndicateID
        case localID
        case networkObjectID
    }
    
    var kind: String?
    var id: Int?
    var uri: String?
    var dateString: String?
    var publishedDate: ContextPublishedDate?
    var updatedDate: ContextUpdatedDate?
    var title: String?
    var subtitle: String?
    var summary: String?
    var url: String?
    var path: String?
    var urlParams: String?
    var attributes: ContextAttributes?
    var assets: ContextAssets?
    var featuredImage: ContextFeaturedImage?
    var categories: [String?]?
    var collections: [String?]?
    var tags: [String?]?
    var byline: [ContextByline]?
    var leadVideo: ContextLeadVideo?
    var primaryCategory: ContextPrimaryCategory?
    var eyebrow: ContextEyebrow?
    var primaryTag: ContextPrimaryTag?
    var sponsor: ContextSponsor?
    var smil: String?
    var isSponsoredArticle: Bool {
        sponsor != nil
    }
    
    var originatingMarket: String?
    var contentSource: String?
    var nationalized: Bool?
    var syndicateID: String?
    var localID: String?
    var networkObjectID: String?
    
}

// MARK: Context Unknown Kind

struct ContextUnknownKind: ContextBaseItem {
    private enum CodingKeys: String, CodingKey {
        case kind
    }
    var kind: String?
}

// MARK: Context Video

struct ContextVideo: ContextItem {
    private enum CodingKeys: String, CodingKey {
        case kind
        case id = "id"
        case uri
        case dateString
        case publishedDate
        case updatedDate
        case title
        case subtitle
        case summary
        case url
        case path
        case urlParams
        case attributes
        case assets
        case featuredImage
        case categories
        case collections
        case terms
        case tags
        case byline
        case primaryCategory
        case eyebrow
        case primaryTag
        case sponsor
        case leadVideo
        // video related values
        case dataSource
        case disablePreroll
        case fwSSID
        case length
        case liveStream
        case pid
        case sensitivity
        case videoID
        case smil
        
        case originatingMarket
        case contentSource
        case nationalized
        case syndicateID
        case localID
        case networkObjectID
    }
    
    var kind: String?
    var id: Int?
    var uri: String?
    var dateString: String?
    var publishedDate: ContextPublishedDate?
    var updatedDate: ContextUpdatedDate?
    var title: String?
    var subtitle: String?
    var summary: String?
    var url: String?
    var path: String?
    var urlParams: String?
    var attributes: ContextAttributes?
    var assets: ContextAssets?
    var featuredImage: ContextFeaturedImage?
    var categories: [String?]?
    var collections: [String?]?
    var terms: [String?]?
    var tags: [String?]?
    var byline: [ContextByline]?
    var leadVideo: ContextLeadVideo?
    var primaryCategory: ContextPrimaryCategory?
    var eyebrow: ContextEyebrow?
    var primaryTag: ContextPrimaryTag?
    var sponsor: ContextSponsor?
    // video related values
    var dataSource: String?
    var disablePreroll: Bool?
    var fwSSID: String?
    var length: Int?
    var liveStream: Bool?
    var pid: String?
    var sensitivity: String?
    var videoID: String?
    var smil: String?
    var isSponsoredArticle: Bool {
        sponsor != nil
    }
    var videoDuration: String?
    
    var originatingMarket: String?
    var contentSource: String?
    var nationalized: Bool?
    var syndicateID: String?
    var localID: String?
    var networkObjectID: String?
}

// MARK: Context Module

private struct TempContextItem: ContextBaseItem {
    var kind: String?
}

struct ContextModule: ContextBaseItem {
    private enum CodingKeys: String, CodingKey {
        case kind
        case id = "id"
        case networkObjectID
        case name
        case slug
        case uri
        case url
        case attributes
        case items
        case sponsor
    }
    
    var kind: String?
    var id: Int?
    var networkObjectID: String?
    var name: String?
    var slug: String?
    var uri: String?
    var url: String?
    var attributes: ContextAttributes?
    var sponsor: ContextSponsor?
    
    private var items: [TempContextItem?]?
    var contextItems = [ContextBaseItem]()
    
}

// MARK: Context VideoCarousel

struct ContextVideoCarousel: ContextBaseItem {
    
    private enum CodingKeys: String, CodingKey {
        case kind
        case id = "id"
        case networkObjectID
        case name
        case slug
        case uri
        case url
        case attributes
        case items
        case sponsor
    }
    
    var kind: String?
    var id: Int?
    var networkObjectID: String?
    var name: String?
    var slug: String?
    var uri: String?
    var url: String?
    var attributes: ContextAttributes?
    var sponsor: ContextSponsor?
    
    private var items: [TempContextItem?]?
    var contextItems = [ContextBaseItem]()
    
}

// MARK: Context Advertisement

struct ContextAdvertisement: ContextBaseItem {
    private enum CodingKeys: String, CodingKey {
        case kind
        case attributes
    }
    
    var kind: String?
    var attributes: ContextAdAttributes?
}

struct ContextAdAttributes: Decodable {
    private enum CodingKeys: String, CodingKey {
        case height
        case width
        case heightIpad = "heightTablet"
        case widthIpad = "widthTablet"
    }
    
    var height: Int?
    var width: Int?
    var heightIpad: Int?
    var widthIpad: Int?
}

