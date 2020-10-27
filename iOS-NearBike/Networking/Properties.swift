//
//  Properties.swift
//  iOS-NearBike
//
//  Created by CM on 27/10/2020.
//

import Foundation
struct Properties : Codable {
    let code : String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
    }

}
