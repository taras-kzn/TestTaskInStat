//
//  NetworkManager.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import Foundation

enum Constants: String {
    case allLeaguesURL = "https://api-football-standings.azharimm.site/leagues"
}

protocol NetworkManagerProtocol {
    func getAllLeagues(completion: @escaping(_ leagues: LeaguesData) -> Void)
    func getSeasons(idLeagues: String, completion: @escaping(_ seasons: SeasonsData) -> Void)
    func getLeaderboard(idLeagues: String,season: String, completion: @escaping(_ leaderboard: LeaderboardData) -> Void)
}

class NetworkManager: NetworkManagerProtocol {

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func getAllLeagues(completion: @escaping(_ leagues: LeaguesData) -> Void) {
        guard let url = URL(string: Constants.allLeaguesURL.rawValue) else { return }

        session.dataTask(with: url) { (data, _, error) in
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

    func getLeaderboard(idLeagues: String,season: String, completion: @escaping (LeaderboardData) -> Void) {
        let seasonsURL = "https://api-football-standings.azharimm.site/leagues/\(idLeagues)/standings?season=\(season)&sort=asc"
        guard let url = URL(string: seasonsURL) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in

            if let error = error { print(error); return }
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let leaderboard = try decoder.decode(LeaderboardData.self, from: data)

                DispatchQueue.main.async {
                    completion(leaderboard)

                    
                }
            } catch let error {
                print("Error serialisation json", error.localizedDescription)
            }
        }.resume()
    }
}


