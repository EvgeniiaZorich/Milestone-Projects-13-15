//
//  Countrie.swift
//  Projects-13-15
//
//  Created by Евгения Зорич on 26.02.2023.
//

import Foundation

struct Country: Codable {
    var country: String
    var abbreviation: String
    var city: String?
    var currency_name: String?
    var government: String?
    var population: Int?
}
