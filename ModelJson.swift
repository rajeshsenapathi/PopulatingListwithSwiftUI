//
//  ModelJson.swift
//  CanadaTableView
//
//  Created by M_AMBIN05148 on 05/04/22.
//

import Foundation

struct ModelJsonObject: Codable ,Identifiable{
let id = UUID()
let title: String?
let rows: [Rows]?

enum CodingKeys: String, CodingKey {

    case title
    case rows
}

init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    rows = try values.decodeIfPresent([Rows].self, forKey: .rows)
}

}
