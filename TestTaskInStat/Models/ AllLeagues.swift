//
//   AllLeagues.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import Foundation

struct LeaguesData: Decodable {
    let status: Bool
    let data: [AllLeagues]
}

struct AllLeagues: Decodable {
    let id: String
    let name: String
    let abbr: String
    let logos: Logos
}

struct Logos: Decodable {
    let light: String
    let dark: String
}
