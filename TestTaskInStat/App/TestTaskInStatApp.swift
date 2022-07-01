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
            let viewModel = LeagueListViewModel()
            LeagueListView(viewModel: viewModel)
        }
    }
}
