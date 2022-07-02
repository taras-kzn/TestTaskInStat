//
//  LeaderboardRowViewModel.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 02.07.2022.
//

import Foundation

protocol LeaderboardRowViewModelProtocol {
    var valueGamesPlayed: String { get }
    var valueDraws: String { get }
    var valuePoints: String { get }
    var nameTeam: String { get }
    var logoTeam: Data? { get }
    var valueLosses: String { get }
    var valueWins: String { get }
    func makeStats()
    init(leaderboard: LeaderboardArray)
}

class LeaderboardRowViewModel: LeaderboardRowViewModelProtocol, ObservableObject {

    @Published var valuePoints: String = ""
    @Published var valueWins: String = ""
    @Published var valueLosses: String = ""
    @Published var valueDraws: String = ""
    @Published var valueGamesPlayed: String = ""

    var nameTeam: String {
        leaderboard.team.name
    }

    var logoTeam: Data? {
        ImageManager.shared.fetchImageData(from: makeLogo(logo: leaderboard.team.logos))
    }

    private let leaderboard: LeaderboardArray

    required init(leaderboard: LeaderboardArray) {
        self.leaderboard = leaderboard
        makeStats()
    }

    private func makeLogo(logo: [Logotype]) -> String {
        var res = ""
        logo.map { url in
            res = url.href
        }
        return res
    }

    func makeStats() {
        for i in leaderboard.stats {
            switch i.shortDisplayName {
            case "L" :
                self.valueLosses = i.displayValue
            case "W" :
                self.valueWins = i.displayValue
            case "P" :
                self.valuePoints = i.displayValue
            case "D" :
                self.valueDraws = i.displayValue
            case "GP" :
                self.valueGamesPlayed = i.displayValue
            default:
                break
            }

        }
    }



    
}
