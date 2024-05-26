//
//  HomeFeature.swift
//  TCATask
//
//  Created by Ayman Atallah on 19/05/2024.
//

import ComposableArchitecture
import Foundation

@Reducer
struct HomeFeature {
    private let apiClient = GiveawayAPIClient(networkManager: NetworkManager())

    @ObservableState
    struct State: Equatable {
        var giveaways: IdentifiedArrayOf<Giveaway> = []
        var banners: [Giveaway] = []
        var isLoading = false
        var path = StackState<GiveawayDetailsFeature.State>()
   }

    enum Action {
        case fetchGiveaways(platform: Platform)
        case fetchBanners
        case giveawaysResponse([Giveaway])
        case bannersResponse([Giveaway])
        case likeButtonTapped(model: Giveaway)
        case path(StackAction<GiveawayDetailsFeature.State, GiveawayDetailsFeature.Action>)
    }

    @Dependency(\.giveawaysRepo) var giveawaysRepo
    @Dependency(\.bannersRepo) var bannersRepo

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchGiveaways(let platform):
                state.isLoading = true
                return .run { send in
                    try await send(.giveawaysResponse(self.giveawaysRepo.fetchGiveaways(platform)))
                }
            case .fetchBanners:
                state.isLoading = true
                return .run { send in
                    try await send(.bannersResponse(self.bannersRepo.fetchBanners()))
                }
            case .giveawaysResponse(let giveaways):
                state.giveaways.removeAll()
                state.giveaways.append(contentsOf: giveaways)
                state.isLoading = false
                return .none
            case .bannersResponse(let banners):
                state.banners = banners
                state.isLoading = false
                return .none
            case .path(.element(id: let id, action: .likeButtonTapped)):
                guard
                    let detailsState = state.path[id: id],
                    let index = state.giveaways.firstIndex(where: { $0.id == detailsState.giveaway.id })
                else { return .none }
                // Update parent state directly, cause we already updated the child state in it's feature.
                state.giveaways.update(detailsState.giveaway, at: index)
                return .none
            case .path(.popFrom(_)):
                return.none
            case .path(.push(id: _, state: _)):
                return .none
            case .likeButtonTapped(model: var model):
                guard
                    let index = state.giveaways.firstIndex(of: model)
                else { return .none }
                if var _ = model.isLiked {
                    model.isLiked?.toggle()
                } else {
                    model.isLiked = true
                }
                state.giveaways.update(model, at: index)
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            GiveawayDetailsFeature()
        }
    }
}
