//
//  Properties.swift
//
//  Created by CM on 28/10/2020
//  Copyright (c) . All rights reserved.
//

import Foundation
struct Properties: Codable {
    let freeRacks, bikes, label, bikeRacks: String?
    //let updated: Updated

    enum CodingKeys: String, CodingKey {
        case freeRacks = "free_racks"
        case bikes, label
        case bikeRacks = "bike_racks"
    //    case updated
    }
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            freeRacks = try values.decodeIfPresent(String.self, forKey: .freeRacks)
            bikes = try values.decodeIfPresent(String.self, forKey: .bikes)
            label = try values.decodeIfPresent(String.self, forKey: .label)
            bikeRacks = try values.decodeIfPresent(String.self, forKey: .bikeRacks)
      //      updated = try values.decodeIfPresent(String.self, forKey: .updated)

        }

    }
