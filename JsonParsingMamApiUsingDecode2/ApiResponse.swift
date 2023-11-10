//
//  ApiResponse.swift
//  JsonParsingMamApiUsingDecode2
//
//  Created by Mac on 06/11/23.
//

import Foundation
struct ApiResponse : Decodable{
    let links : Link?
    let categories : [Categorys]?
    let summary : String?
    let teleportcityscore : Double?
    enum apiResponse : String , CodingKey{
        case summary, categories , links = "_links" ,teleportcityscore = "teleport_city_score"
    }
    init(from decoder: Decoder) throws {
        let apiResponseContainer = try decoder.container(keyedBy: apiResponse.self)
        self.links = try apiResponseContainer.decode(Link.self , forKey: .links)
        self.teleportcityscore = try apiResponseContainer.decode(Double? .self, forKey: .teleportcityscore)
        self.categories = try apiResponseContainer.decode([Categorys]?.self, forKey: .categories)
        self.summary = try apiResponseContainer.decodeIfPresent(String.self, forKey: .summary)
        
    }
}
struct Link :Decodable{
    let curies : [Cury]?
    let linkSelf : LinkSelf?
    enum eachLink : String ,CodingKey{
        case linkSelf = "self" , curies
    }
    init(from decoder: Decoder) throws {
        let link = try decoder.container(keyedBy: eachLink.self)
        self.linkSelf = try link.decode(LinkSelf?.self, forKey: .linkSelf)
        self.curies = try link.decode([Cury]?.self, forKey: .curies)
    }
}
struct Categorys:Decodable{
    let name : String?
    let colour : String?
    let scoreOutOf : Double?
    enum categorys : String ,CodingKey{
        case scoreOutOf = "score_out_of_10"
        case  colour = "color", name
    }
    init(from decoder: Decoder) throws {
        let category = try decoder.container(keyedBy: categorys.self)
        self.name = try category.decodeIfPresent(String.self, forKey: .name)
        self.colour = try category.decode(String.self, forKey: .colour)
        self.scoreOutOf = try category.decodeIfPresent(Double.self, forKey: .scoreOutOf)
    }
}
struct Cury : Decodable{
    let href :String?
    let name : String?
    let templet : Bool?
    enum cury :String ,CodingKey{
        case templet = "templated"
        case name = "name"
        case href = "href"
    }
    init(from decoder: Decoder) throws {
        let curyData = try decoder.container(keyedBy: cury.self)
        self.name = try curyData.decode(String?.self, forKey: .name)
        self.href = try curyData.decode(String?.self, forKey: .href)
        self.templet = try curyData.decode(Bool?.self, forKey: .templet)
    }
}
struct LinkSelf : Decodable{
    let href : String
}
