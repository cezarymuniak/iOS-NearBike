//
//  BaseModel.swift
//
//  Created by CM on 28/10/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

struct BaseModel: Codable {

    let features: [Features]?
    let crs: Crs?
    let type: String?

    enum CodingKeys: String, CodingKey {

        case features = "features"
        case crs = "crs"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        features = try values.decodeIfPresent([Features].self, forKey: .features)
        crs = try values.decodeIfPresent(Crs.self, forKey: .crs)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
