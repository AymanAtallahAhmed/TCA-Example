//
//  StretchyHeaderView.swift
//  TCATask
//
//  Created by Ayman Atallah on 25/05/2024.
//

import SwiftUI

protocol StretchyHeaderViewDelegate {
    func likeButtonDidTap(model: Giveaway)
    func backButtonDidTap()
}

struct StretchyHeaderView: View {
    var giveaway: Giveaway
    var delegate: StretchyHeaderViewDelegate?

    var body: some View {
        GeometryReader { proxy in
            let frame = proxy.frame(in: .global)
            ZStack {
                CachedAsyncImage(url: URL(string: giveaway.image ?? ""), content: { imagePhase in
                    if case .success(let image) = imagePhase {
                        image
                            .resizable()
                    }
                })
                Color.init(red: 0, green: 0, blue: 0, opacity: 0.7)
                VStack() {
                    HStack {
                        Button(action: {
                            delegate?.backButtonDidTap()
                        }, label: {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundColor(.white)
                                .font(.title)
                        })
                        .padding(EdgeInsets(top: 70, leading: 16, bottom: 0, trailing: 0))
                        Spacer()
                        Button(action: {
                            delegate?.likeButtonDidTap(model: giveaway)
                        }, label: {
                            Image(systemName: giveaway.isLiked ?? false ? "heart.fill" : "heart")
                                .font(.title)
                        })
                        .foregroundColor(giveaway.isLiked ?? false ? .red : .white)
                        .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 16))
                    }
                    Spacer()
                    HStack {
                        Text(giveaway.title!)
                            .font(.system(size: 24, weight: .bold))
                        Spacer()
                        Link(destination: URL(string: giveaway.gamerpower_url ?? "")!, label: {
                            Text("Get It")
                                .padding(.horizontal, 6)
                                .font(.system(size: 16, weight: .bold))
                        })
                        .frame(width: 70, height: 30)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(10)
                    }
                    .padding(10)
                    .foregroundColor(.white)
                }
            }
            .offset(y: frame.minY > 0 ? -frame.minY : 0)
            .frame(height: frame.minY > 0 ? (UIScreen.main.bounds.width + frame.minY) : UIScreen.main.bounds.width)
        }
    }
}

//#Preview {
//    StretchyHeaderView(giveaway: Giveaway.sample)
//}
