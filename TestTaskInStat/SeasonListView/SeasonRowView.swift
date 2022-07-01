//
//  SeasonRowView.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import SwiftUI

struct SeasonRowView: View {
    
    let viewModel: SeasonRowViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            year
            Spacer()
            description
            Spacer()
        }
        .padding(.all, 10)
    }
}

extension SeasonRowView {
    var year: some View {
        VStack(spacing: 12) {
            Text("Year")
            Text(viewModel.year)
        }
    }
    
    var description: some View {
        VStack(spacing: 12) {
            Text(viewModel.seasonDate)
                .font(Font.system(size: 12))
                .font(.subheadline)
                .multilineTextAlignment(.center)
            Text(viewModel.description)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
    }
}


struct SeasonRowView_Previews: PreviewProvider {
    static var previews: some View {
        let seasons = SeasonsArray(year: 2, startDate: "", endDate: "", displayName: "")
        let viewModel = SeasonRowViewModel(seasons: seasons)
        SeasonRowView(viewModel: viewModel)
    }
}
