//
//  NetworkManager.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func getAllLeagues(completion: @escaping(_ leagues: LeaguesData) -> Void)
    func getSeasons(idLeagues: String, completion: @escaping(_ seasons: SeasonsData) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()

    private init() {}

    func getAllLeagues(completion: @escaping(_ leagues: LeaguesData) -> Void) {
        guard let url = URL(string: Constants.allLeaguesURL.rawValue) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let leagues = try decoder.decode(LeaguesData.self, from: data)
                DispatchQueue.main.async {
                    completion(leagues)
                }
            } catch let error {
                print("Error serialisation json", error.localizedDescription)
            }
        }.resume()

    }

    func getSeasons(idLeagues: String, completion: @escaping (_ seasons: SeasonsData) -> Void) {
        let seasonsURL = "https://api-football-standings.azharimm.site/leagues/\(idLeagues)/seasons"
        guard let url = URL(string: seasonsURL) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let seasons = try decoder.decode(SeasonsData.self, from: data)
                DispatchQueue.main.async {
                    completion(seasons)
                }
            } catch let error {
                print("Error serialisation json", error.localizedDescription)
            }
        }.resume()
    }

}

enum Constants: String {
    case allLeaguesURL = "https://api-football-standings.azharimm.site/leagues"
    case seasonsURL = "https://api-football-standings.azharimm.site/leagues/eng.1/seasons"
}

