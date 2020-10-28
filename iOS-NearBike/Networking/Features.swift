//
//  Features.swift
//
//  Created by CM on 28/10/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Features: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case type
    case properties
    case geometry
  }

  var id: String?
  var type: String?
  var properties: Properties?
  var geometry: Geometry?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    properties = try container.decodeIfPresent(Properties.self, forKey: .properties)
    geometry = try container.decodeIfPresent(Geometry.self, forKey: .geometry)
  }

}
