//
//  BannerView.swift
//  TCATask
//
//  Created by Ayman Atallah on 18/05/2024.
//

import SwiftUI

struct BannerView: View {
    var giveaways: [Giveaway]
    @State private var currentIndex: Int = 0

    @State var giveway: Giveaway?
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(giveaways) { model in
                    BannerCardView(model: model)
                        .scrollTransition(topLeading: .identity,
                                          bottomTrailing: .animated,
                                          axis: .horizontal)
                    { effect, phase in
                        effect
                            .scaleEffect(1 - abs(phase.value))
                            .opacity(1 - abs(phase.value))
                            .rotation3DEffect(.degrees(phase.value * 90),
                                              axis: (x: 0, y: 0.5, z: 0.7))
                    }
                }
                .frame(width: 350, height: 200)
            }
            .scrollTargetLayout()
        }
        .padding()
        .safeAreaPadding(.horizontal, 8)
        .scrollClipDisabled()
        .scrollTargetBehavior(.viewAligned)
        .scrollPosition(id: $giveway)
    }
}


#Preview {
    BannerView(giveaways: Giveaway.samples)
}
