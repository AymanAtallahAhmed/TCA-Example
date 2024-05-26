//
//  HomeFeatureTests.swift
//  TCATaskTests
//
//  Created by Ayman Atallah on 26/05/2024.
//

import ComposableArchitecture
import XCTest
@testable import TCATask

final class HomeFeatureTests: XCTestCase {

    @MainActor
    func testFetchingGiveaways() async {
        let store = TestStore(initialState: HomeFeature.State()) {
            HomeFeature()
        } withDependencies: { dependency in
            dependency.giveawaysRepo.fetchGiveaways = { _ in
                return Giveaway.samples
            }
        }

        store.exhaustivity = .off
        await store.send(.fetchGiveaways(platform: .all)) {
            $0.isLoading = true
        }

        await store.receive(\.giveawaysResponse) {
            $0.isLoading = false
        }
    }

    @MainActor
    func testFetchingBanners() async {
        let store = TestStore(initialState: HomeFeature.State()) {
            HomeFeature()
        } withDependencies: { dependency in
            dependency.bannersRepo.fetchBanners = {
                return Giveaway.samples
            }
        }

        store.exhaustivity = .off
        await store.send(.fetchBanners) {
            $0.isLoading = true
        }

        await store.receive(\.bannersResponse) {
            $0.isLoading = false
            $0.banners = Giveaway.samples
        }
    }
}
