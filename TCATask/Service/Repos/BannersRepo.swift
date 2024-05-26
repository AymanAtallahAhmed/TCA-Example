//
//  BannersRepo.swift
//  TCATask
//
//  Created by Ayman Atallah on 27/05/2024.
//

import Foundation
import ComposableArchitecture

struct BannersRepo {
    private static let apiClient: GiveawayAPIClient = .init(networkManager: .init())
    var fetchBanners: () async throws -> [Giveaway]
}

extension BannersRepo: DependencyKey {
    static var liveValue = Self (
        fetchBanners: {
            let response = await apiClient.fetchBanners()
            if case let .success(giveaways) = response {
                return giveaways
            } else {
                return []
            }
        }
    )
}

extension DependencyValues {
    var bannersRepo: BannersRepo {
        get { self[BannersRepo.self] }
        set { self[BannersRepo.self] = newValue }
    }
}
