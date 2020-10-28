//
//  Crs.swift
//
//  Created by CM on 28/10/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Crs: Codable {

  enum CodingKeys: String, CodingKey {
    case properties
    case type
  }

  var properties: Properties?
  var type: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    properties = try container.decodeIfPresent(Properties.self, forKey: .properties)
    type = try container.decodeIfPresent(String.self, forKey: .type)
  }

}
