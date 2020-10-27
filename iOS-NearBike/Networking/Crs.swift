//
//  Crs.swift
//  iOS-NearBike
//
//  Created by CM on 27/10/2020.
//

import Foundation

struct Crs : Codable {
    let type : String?
    let properties : Properties?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case properties = "properties"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        properties = try values.decodeIfPresent(Properties.self, forKey: .properties)
    }

}
