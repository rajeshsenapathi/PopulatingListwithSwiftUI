//
//  Rows.swift
//  CanadaTableView
//
//  Created by M_AMBIN05148 on 05/04/22.
//

import Foundation

struct Rows: Codable,Identifiable {
    let id = UUID()
    let title: String?
    let description: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case description
        case imageHref
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        imageHref = try values.decodeIfPresent(String.self, forKey: .imageHref)
    }

}
