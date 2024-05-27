//
//  GiveawayDetailsFeature.swift
//  TCATask
//
//  Created by Ayman Atallah on 25/05/2024.
//

import ComposableArchitecture

@Reducer
struct GiveawayDetailsFeature {
    @ObservableState
    struct State: Equatable {
        var giveaway: Giveaway

        init(giveaway: Giveaway) {
            self.giveaway = giveaway
        }
    }

    enum Action {
        case likeButtonTapped
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .likeButtonTapped:
                if var _ = state.giveaway.isLiked {
                    state.giveaway.isLiked?.toggle()
                } else {
                    state.giveaway.isLiked = true
                }
                return .none
            }
        }
    }
}
