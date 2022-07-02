//
//  SeasonsListViewModel.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import Foundation
import SwiftUI

protocol SeasonsListViewModelProtocol {
    var rows: [SeasonRowViewModel] { get }
    func getSeasonsAvailable()
    init(networkManager: NetworkManagerProtocol, idLeague: String)
}

class SeasonsListViewModel: SeasonsListViewModelProtocol, ObservableObject {

    @Published var rows: [SeasonRowViewModel] = []
    @Published private(set) var state = ModelState.ready

    private let networkManager: NetworkManagerProtocol
    var idLeague: String

    required init(networkManager: NetworkManagerProtocol, idLeague: String) {
        self.networkManager = networkManager
        self.idLeague = idLeague
    }

    func getSeasonsAvailable() {
        state = .loading
        networkManager.getSeasons(idLeagues: idLeague) { [weak self] seasons in
            guard let self = self else { return }
            self.state = .ready

            seasons.data.seasons.forEach { data in

                let seasonRowViewModel = SeasonRowViewModel(seasons: data)
                self.rows.append(seasonRowViewModel)
            }
        }
    }
}
