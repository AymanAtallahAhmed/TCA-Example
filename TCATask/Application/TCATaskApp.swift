//
//  TCATaskApp.swift
//  TCATask
//
//  Created by Ayman Atallah on 17/05/2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCATaskApp: App {
    static let store = Store(initialState: HomeFeature.State()) {
        HomeFeature()
    }

    var body: some Scene {
        WindowGroup {
            HomeView(store: TCATaskApp.store )
        }
    }
}
