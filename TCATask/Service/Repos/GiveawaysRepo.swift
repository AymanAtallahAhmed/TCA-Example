//
//  GiveawaysRepo.swift
//  TCATask
//
//  Created by Ayman Atallah on 25/05/2024.
//

import Foundation
import ComposableArchitecture

struct GiveawaysRepo {
    private static let apiClient: GiveawayAPIClient = .init(networkManager: .init())
    var fetchGiveaways: (Platform) async throws -> [Giveaway]
}

extension GiveawaysRepo: DependencyKey {
    static var liveValue = Self (
        fetchGiveaways: { platform in
            let response = await apiClient.fetchGiveaways(for: platform)
            if case let .success(giveaways) = response {
                return giveaways
            } else {
                return []
            }
        }
    )
}

extension DependencyValues {
    var giveawaysRepo: GiveawaysRepo {
        get { self[GiveawaysRepo.self] }
        set { self[GiveawaysRepo.self] = newValue }
    }
}
