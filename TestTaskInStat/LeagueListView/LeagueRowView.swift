//
//  RowView.swift
//  TestTaskInStat
//
//  Created by admin on 01.07.2022.
//

import SwiftUI

struct LeagueRowView: View {

    let viewModel: LeagueRowViewModel

    var body: some View {
        HStack(spacing: 12) {
            LeagueImage(imageData: viewModel.logoData, imageSize: CGSize(width: 60, height: 60), cornerRadius: 0, shadowIsOn: true)
            Spacer()
            title
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

extension LeagueRowView {
    var title: some View {
        VStack(spacing: 12) {
            VStack {
                Text("Название Лиги:")
                    .font(.subheadline)
                Text(viewModel.nameLeague)
                    .font(.headline)
            }
            VStack {
                Text("аббревиатура:")
                    .font(.subheadline)
                Text(viewModel.abbreviation)
                    .font(.headline)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        let leagues = AllLeagues(id: "1", name: "Argentine Liga Profesional de Fútbol", abbr: "Prim A", logos: Logos(light: "gamecontroller", dark: "gamecontroller.fill"))
        let viewModel = LeagueRowViewModel(allLeagues: leagues)
        LeagueRowView(viewModel: viewModel)
    }
}
