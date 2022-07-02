//
//  Leaderboard.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import Foundation
import SwiftUI

struct LeaderboardData: Decodable {
    let status: Bool
    let data: Leaderboard
}

struct Leaderboard: Decodable {
    let name: String
    let abbreviation: String
    let seasonDisplay: String
    let season: Int
    let standings: [LeaderboardArray]
}

struct LeaderboardArray: Decodable {
    let team: TeamArray
    let stats: [Stats]
}

struct TeamArray: Decodable {
    let id: String
    let name: String
    let logos: [Logotype]
}

struct Logotype: Decodable {
    let href: String
    let lastUpdated: String
}

struct Stats: Decodable {
    let type: String
    let displayName: String
    let shortDisplayName: String
    let displayValue: String
    let description: String
}


