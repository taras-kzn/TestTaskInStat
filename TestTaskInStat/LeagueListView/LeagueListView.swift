//
//  LeagueListView.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import SwiftUI

struct LeagueListView: View {

    @ObservedObject var viewModel: LeagueListViewModel

    init(viewModel: LeagueListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List(viewModel.rows, id: \.nameLeague) { leagueRowViewModel in
                LeagueRowView(viewModel: leagueRowViewModel)
            }
            .navigationBarTitle("Leagues")
        }
        .onAppear {
            viewModel.getAllLeaguesAvailable()
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LeagueListViewModel()
        LeagueListView(viewModel: viewModel)
    }
}
