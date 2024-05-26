//
//  BannerCardView.swift
//  TCATask
//
//  Created by Ayman Atallah on 17/05/2024.
//

import SwiftUI

struct BannerCardView: View {
    @State var model: Giveaway
    var body: some View {
        ZStack {
            CachedAsyncImage(url: URL(string: model.image ?? ""), content: { imagePhase in
                if case .success(let image) = imagePhase {
                    image
                        .resizable()
                        .shadow(radius: 10, y: 10)
                }
            })

            Color.init(red: 0, green: 0, blue: 0, opacity: 0.5)
            VStack(alignment: .leading) {
                Text(model.title!)
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                Text(model.description!)
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .medium))
            }
            .padding(10)
        }
        .cornerRadius(15)
    }
}

#Preview {
    BannerCardView(model: .sample)
        .previewLayout(.fixed(width: 400, height: 300))
}
