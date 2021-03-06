//
//  LeagueListView.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import SwiftUI

struct LeagueListView: View {

  //  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: LeagueListViewModel

    init(viewModel: LeagueListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(2)
            case .ready:
                List(viewModel.rows, id: \.idLeague) { leagueRowViewModel in
                    let networkManager = NetworkManager()
                    let viewModel =  SeasonsListViewModel(networkManager: networkManager, idLeague: leagueRowViewModel.idLeague)
                    NavigationLink(destination: SeasonListView(viewModel: viewModel)) {
                        LeagueRowView(viewModel: leagueRowViewModel)
                    }
                }
                .navigationBarTitle("Leagues")
            }
        }
        .onAppear {
            viewModel.getAllLeaguesAvailable()
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        let networkManager = NetworkManager()
        let viewModel = LeagueListViewModel(networkManager: networkManager)
        LeagueListView(viewModel: viewModel)
    }
}
