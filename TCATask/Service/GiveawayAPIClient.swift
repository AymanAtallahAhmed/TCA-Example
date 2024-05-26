//
//  GiveawayAPIClient.swift
//  TCATask
//
//  Created by Ayman Atallah on 25/05/2024.
//

import Foundation

struct GiveawayAPIClient {
    private let networkManager: NetworkManager
    private let giveawaysEndpoint = "https://gamerpower.com/api/giveaways"
    private let bannersEndpoint = "https://www.gamerpower.com/api/giveaways?platform=epic-games-store"

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func fetchBanners() async -> Result<[Giveaway], Error> {
        do {
            let giveaways = try await networkManager.request(
                method: .get,
                url: bannersEndpoint,
                headers: [:],
                params: [:],
                of: [Giveaway].self)
            return .success(giveaways)
        } catch {
            return .failure(error)
        }
    }

    func fetchGiveaways(for platform: Platform) async -> Result<[Giveaway], Error> {
        let path = platform == .all ? "" : "?platform=\(platform.rawValue)"
        let finalURL = giveawaysEndpoint + path
        do {
            let giveaways = try await networkManager.request(
                method: .get,
                url: finalURL,
                headers: [:],
                params: [:],
                of: [Giveaway].self)
            return .success(giveaways)
        } catch {
            return .failure(error)
        }
    }
}
