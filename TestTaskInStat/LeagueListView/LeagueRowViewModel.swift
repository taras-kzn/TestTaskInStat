//
//  LeagueRowViewModel.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import Foundation

protocol LeagueRowViewModelProtocol {
    var nameLeague: String { get }
    var abbreviation: String { get }
    var logoData: Data? { get }
    init(allLeagues: AllLeagues)
}

class LeagueRowViewModel: LeagueRowViewModelProtocol, ObservableObject {
    var nameLeague: String {
        leagues.name
    }

    var abbreviation: String {
        leagues.abbr
    }

    var logoData: Data? {
        ImageManager.shared.fetchImageData(from: leagues.logos.light)
    }

    private let leagues: AllLeagues

    required init(allLeagues: AllLeagues) {
        self.leagues = allLeagues
    }
    
}
