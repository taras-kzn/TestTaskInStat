//
//  TestTaskInStatApp.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import SwiftUI

@main
struct TestTaskInStatApp: App {
    var body: some Scene {
        WindowGroup {
            let networkManager = NetworkManager.shared
            let viewModel = LeagueListViewModel(networkManager: networkManager)
            LeagueListView(viewModel: viewModel)
        }
    }
}
