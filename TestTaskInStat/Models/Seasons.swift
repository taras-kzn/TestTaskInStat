//
//  Seasons.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import Foundation

struct SeasonsData: Decodable {
    let status: Bool
    let data: Seasons
}

struct Seasons: Decodable {
    let name: String?
    let desc: String
    let abbreviation: String?
    let seasons: [SeasonsArray]
}

struct SeasonsArray: Decodable {
    let year: Int
    let startDate: String
    let endDate: String
    let displayName: String
   // let types: [Types]
}

struct Types: Decodable {
    let id: String
    let name: String
    let abbreviation: String
    let startDate: String
    let endDate: String
    let hasStandings: Bool
}
