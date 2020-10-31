//
//  Geometry.swift
//
//  Created by CM on 28/10/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Geometry: Codable {

  enum CodingKeys: String, CodingKey {
    case coordinates
    case type
  }

  var coordinates: [Float]?
  var type: String?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    coordinates = try container.decodeIfPresent([Float].self, forKey: .coordinates)
    type = try container.decodeIfPresent(String.self, forKey: .type)
  }

}
