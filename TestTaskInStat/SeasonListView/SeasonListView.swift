//
//  SeasonListView.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import SwiftUI

struct SeasonListView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: SeasonsListViewModel

    init(viewModel: SeasonsListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List(viewModel.rows, id: \.year) { seasonsRowViewModel in
                SeasonRowView(viewModel: seasonsRowViewModel)
            }
            .navigationBarTitle("Seasons")
            .navigationBarItems(leading: buttonBack)
        }
        .onAppear {
            viewModel.getSeasonsAvailable()
        }
        .navigationBarHidden(true)
    }
}

extension SeasonListView {
    var buttonBack: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 11, height: 18)
                    .font(.title2)
                    .foregroundColor(.gray)
                    .frame(height: 10)
                Text("Leagues")
                    .foregroundColor(.gray)
                    .font(Font.custom("SFProDisplay-Regular", size: 15))
                Spacer()
            }
        }
    }
}

struct SeasonListView_Previews: PreviewProvider {
    static var previews: some View {
        let networkManager = NetworkManager.shared
        let viewModel = SeasonsListViewModel(networkManager: networkManager, idLeague: "")
        SeasonListView(viewModel: viewModel)
    }
}
