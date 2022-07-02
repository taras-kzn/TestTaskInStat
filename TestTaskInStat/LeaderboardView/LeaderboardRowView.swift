//
//  LeaderboardRowView.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 02.07.2022.
//

import SwiftUI

struct LeaderboardRowView: View {

    let viewModel: LeaderboardRowViewModel

    var body: some View {
        HStack(spacing: 10) {
            LeagueImage(imageData: viewModel.logoTeam, imageSize: CGSize(width: 25, height: 25), cornerRadius: 0, shadowIsOn: true)
            Text(viewModel.nameTeam)
                .font(.headline)
                .frame(width: 100)
                .multilineTextAlignment(.center)
            Spacer()
            Text(viewModel.valuePoints)
                .frame(width: 25)
            Text(viewModel.valueWins)
                .frame(width: 25)
            Text(viewModel.valueLosses)
                .frame(width: 25)
            Text(viewModel.valueDraws)
                .frame(width: 25)
            Text(viewModel.valueGamesPlayed)
                .frame(width: 25)
        }
    }
}
