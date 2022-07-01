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
}

class LeagueListViewModel: LeagueListViewModelProtocol, ObservableObject {
    @Published var rows: [LeagueRowViewModel] = []

    func getAllLeaguesAvailable() {
        NetworkManager.shared.getAllLeagues { [weak self] leaguesData in
            guard let self = self else { return }
            leaguesData.data.forEach { data in
                let leagueRowViewModel = LeagueRowViewModel(allLeagues: data)
                self.rows.append(leagueRowViewModel)
            }
        }
    }
}