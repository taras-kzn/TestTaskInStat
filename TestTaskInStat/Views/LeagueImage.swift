//
//  LeagueImage.swift
//  TestTaskInStat
//
//  Created by Denis Tarasov on 01.07.2022.
//

import SwiftUI

struct LeagueImage: View {
    let imageData: Data?
    let imageSize: CGSize
    let cornerRadius: CGFloat
    let shadowIsOn: Bool
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowIsOn ? 10 : 0)

    }

    private func getImage(from data: Data?) -> Image {
        guard let imageData = data else { return Image(systemName: "photo.circle") }
        guard let uiImage = UIImage(data: imageData) else { return Image(systemName: "photo.circle") }
        return Image(uiImage: uiImage)
    }
}

struct LeagueImage_Previews: PreviewProvider {
    static var previews: some View {
        LeagueImage(imageData: nil, imageSize: CGSize(width: 100, height: 100), cornerRadius: 0, shadowIsOn: true)
    }
}
