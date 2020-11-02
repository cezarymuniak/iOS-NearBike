//
//  Features.swift
//
//  Created by CM on 28/10/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Features: Codable {
    let geometry: Geometry?
    let id: String?
    let type: String?
    let properties: Properties?

    enum CodingKeys: String, CodingKey {

        case geometry = "geometry"
        case id = "id"
        case type = "type"
        case properties = "properties"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        geometry = try values.decodeIfPresent(Geometry.self, forKey: .geometry)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        properties = try values.decodeIfPresent(Properties.self, forKey: .properties)
    }

}
