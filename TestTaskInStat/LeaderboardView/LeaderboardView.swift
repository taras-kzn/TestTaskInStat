//
//  LeaderboardView.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import SwiftUI

struct LeaderboardView: View {
    @ObservedObject var viewModel: LeaderboardViewModel

    init(viewModel: LeaderboardViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 20) {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(2)
            case .ready:
                title
                topView

                List(viewModel.rows, id: \.nameTeam) { leaderboardRowViewModel in
                        LeaderboardRowView(viewModel: leaderboardRowViewModel)
                }

            }
        }
        .onAppear {
            viewModel.getLeaderboard()
        }
    }
}

extension LeaderboardView {
    var topView: some View {
        HStack(spacing: 10) {
            LeagueImage(imageData: nil, imageSize: CGSize(width: 25, height: 25), cornerRadius: 0, shadowIsOn: true)
            Text("Team")
                .frame(width: 100)
            Spacer()
            Text("P")
                .frame(width: 25)
            Text("W")
                .frame(width: 25)
            Text("L")
                .frame(width: 25)
            Text("D")
                .frame(width: 25)
            Text("GP")
                .frame(width: 25)
        }
        .padding(.leading, 40)
        .padding(.trailing, 40)
    }
    var title: some View {
        HStack{
            Text(viewModel.nameLeague)
                .font(.title)
                .padding(.leading, 38)
            Spacer()
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        let networkManager = NetworkManager()
        let season = "2020"
        let viewModel = LeaderboardViewModel(networkManager: networkManager, season: season, idLeagues: "")
        LeaderboardView(viewModel: viewModel)
    }
}
