//
//  GiveawayDetailsView.swift
//  TCATask
//
//  Created by Ayman Atallah on 25/05/2024.
//

import SwiftUI
import ComposableArchitecture

struct GiveawayDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @State var store: StoreOf<GiveawayDetailsFeature>

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                StretchyHeaderView(giveaway: store.giveaway, delegate: self)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)

                HStack(alignment: .center) {
                    VerticalInfoView(
                        imageName: "dollarsign.square.fill",
                        info: store.giveaway.worth ?? "")
                    Divider()
                    VerticalInfoView(
                        imageName: "person.2.fill",
                        info: "\(store.giveaway.users ?? 0)")
                    Divider()
                    VerticalInfoView(
                        imageName: "gamecontroller.fill",
                        info: store.giveaway.type?.rawValue ?? "")
                }
                .frame(width: UIScreen.main.bounds.width, height: 80)
                Spacer()
                DescriptionView(
                    title: "Platforms",
                    description: store.giveaway.platforms ?? "")
                DescriptionView(
                    title: "Giveaway End Date",
                    description: store.giveaway.end_date ?? "")
                DescriptionView(
                    title: "Description",
                    description: store.giveaway.description ?? "")
            }
            .padding(.top, -(UIApplication.safeArea().top))
        }
        .navigationBarHidden(true)
    }
}

extension GiveawayDetailsView: StretchyHeaderViewDelegate {
    func likeButtonDidTap(model: Giveaway) {
        store.send(.likeButtonTapped)
    }

    func backButtonDidTap() {
        dismiss()
    }
}

#Preview {
    GiveawayDetailsView(store: Store(initialState: GiveawayDetailsFeature.State(giveaway: Giveaway.sample)) {
        GiveawayDetailsFeature()
    })
}
