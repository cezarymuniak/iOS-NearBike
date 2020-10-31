//
//  Properties.swift
//
//  Created by CM on 28/10/2020
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Properties: Codable {

//  enum CodingKeys: String, CodingKey {
//    case bikeRacks = "bike_racks"
//    case bikes
//    case label
//    case updated
//    case freeRacks = "free_racks"
//  }

  var bikeRacks: String?
  var bikes: String?
  var label: String?
  var updated: String?
  var freeRacks: String?

//
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    bikeRacks = try container.decodeIfPresent(String.self, forKey: .bikeRacks)
//    bikes = try container.decodeIfPresent(String.self, forKey: .bikes)
//    label = try container.decodeIfPresent(String.self, forKey: .label)
//    updated = try container.decodeIfPresent(String.self, forKey: .updated)
//    freeRacks = try container.decodeIfPresent(String.self, forKey: .freeRacks)
//  }

}
