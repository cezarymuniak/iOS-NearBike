//
//  BaseModel.swift
//
//  Created by CM on 28/10/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

struct BaseModel: Codable {

  enum CodingKeys: String, CodingKey {
    case crs
    case type
    case features
  }

  var crs: Crs?
  var type: String?
  var features: [Features]?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    crs = try container.decodeIfPresent(Crs.self, forKey: .crs)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    features = try container.decodeIfPresent([Features].self, forKey: .features)
  }

}
