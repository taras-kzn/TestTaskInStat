//
//  LeagueListViewModel.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import Foundation
import SwiftUI

protocol LeagueListViewModelProtocol {
    var rows: [LeagueRowViewModel] { get }
    func getAllLeaguesAvailable()
    init(networkManager: NetworkManagerProtocol)
}

class LeagueListViewModel: LeagueListViewModelProtocol, ObservableObject {
    @Published var rows: [LeagueRowViewModel] = []
    @Published private(set) var state = ModelState.ready
    private let networkManager: NetworkManagerProtocol
    var idLeague: String = ""

    required init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func getAllLeaguesAvailable() {
        state = .loading
        networkManager.getAllLeagues { [weak self] leaguesData in
            guard let self = self else { return }
            self.state = .ready
            leaguesData.data.forEach { data in
                let leagueRowViewModel = LeagueRowViewModel(allLeagues: data)
                self.rows.append(leagueRowViewModel)
            }
        }
    }
}


