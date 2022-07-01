//
//  SeasonRowViewModel.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import Foundation

protocol SeasonRowViewModelProtocol {
    var year: String { get }
    var seasonDate: String { get }
    var description: String { get }
    init(seasons: SeasonsArray)
}

class SeasonRowViewModel: SeasonRowViewModelProtocol, ObservableObject {
    var year: String {
        String(season.year)
    }

    var seasonDate: String {
        "Date: \(getFormattedDate(dateString: season.startDate)) - \(getFormattedDate(dateString: season.endDate))"
    }

    var description: String {
        season.displayName
    }

    private let season: SeasonsArray

    required init(seasons: SeasonsArray) {
        self.season = seasons
    }

    private func getFormattedDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
        let date = dateFormatter.date(from: dateString)
        guard let date = date else {return "no date"}
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let result = dateFormatter.string(from: date)
        return result
    }
}



