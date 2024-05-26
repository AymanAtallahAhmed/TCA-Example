//
//  GiveawayCardView.swift
//  TCATask
//
//  Created by Ayman Atallah on 18/05/2024.
//

import SwiftUI

struct GiveawayCardView: View {
    var model: Giveaway

    var likeButtonTapped: (() -> Void)?
    var body: some View {
        ZStack {
            CachedAsyncImage(url: URL(string: model.image ?? ""), content: { imagePhase in
                if case .success(let image) = imagePhase {
                    image
                        .resizable()
                        .shadow(radius: 10, y: 10)
                }
            })
            Color.init(red: 0, green: 0, blue: 0, opacity: 0.7)
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(model.title!)
                            .font(.system(size: 26, weight: .bold))
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Button(action: {
                            likeButtonTapped?()
                        }, label: {
                            Image(systemName: model.isLiked ?? false ? "heart.fill" : "heart")
                        })
                        .foregroundColor(model.isLiked ?? false ? .red : .white)
                        .font(.title)
                        .padding(.top, 8)
                    }
                    .foregroundColor(.white)
                    Text(model.platforms!)
                        .font(.system(size: 12, weight: .light))
                        .padding(.top, 1)
                        .foregroundColor(.gray)
                }
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
    GiveawayCardView(model: .sample)
}
