//
//  LeaderboardViewModel.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import Foundation
import SwiftUI

enum ModelState {
    case loading
    case ready
}

protocol LeaderboardViewModelProtocol {
    var nameLeague: String { get }
    var rows: [LeaderboardRowViewModel] { get }
    init(networkManager: NetworkManagerProtocol, season: String, idLeagues: String)
    func getLeaderboard()
}

class LeaderboardViewModel: LeaderboardViewModelProtocol, ObservableObject {
    @Published var nameLeague: String = ""
    @Published var rows: [LeaderboardRowViewModel] = []
    @Published private(set) var state = ModelState.ready
    let networkManager: NetworkManagerProtocol
    var season: String
    var idLeagues: String

    required init(networkManager: NetworkManagerProtocol, season: String, idLeagues: String) {
        self.networkManager = networkManager
        self.idLeagues = idLeagues
        self.season = season
    }

    func getLeaderboard() {
        state = .loading
        networkManager.getLeaderboard(idLeagues: idLeagues, season: season) { [weak self] leaderboard in
            guard let self = self else { return }
            self.state = .ready
            self.nameLeague = leaderboard.data.name

            leaderboard.data.standings.flatMap { data in
                let leaderboardRowViewModel = LeaderboardRowViewModel(leaderboard: data)
                self.rows.append(leaderboardRowViewModel)
            }
        }
    }
}

