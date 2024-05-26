//
//  HomeView.swift
//  TCATask
//
//  Created by Ayman Atallah on 17/05/2024.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    @Bindable var store: StoreOf<HomeFeature>

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            ScrollView(.vertical) {
                LazyVStack {
                    WelcomeView(title: "Explore Games Giveaways",
                                userName: "Ayman",
                                userImage: "figure.run")
                    Spacer(minLength: .init(10))
                    BannerView(giveaways: store.banners)
                    Spacer()
                    TabsView<Platform>(tabs: Platform.allCases, currentSelection: .all) { item in
                        store.send(.fetchGiveaways(platform: item))
                    }
                    ForEach(store.giveaways) { giveaway in
                        NavigationLink(state: GiveawayDetailsFeature.State(giveaway: giveaway)) {
                            GiveawayCardView(model: giveaway) {
                                store.send(.likeButtonTapped(model: giveaway))
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                    .frame(width: 350, height: 350)
                    .padding(.top, 10)
                    
                }
                Spacer()
                    .background(.red)
            }
        } destination: { store in
            GiveawayDetailsView(store: store)
        }
        .navigationBarHidden(true)
        .onAppear(perform: {
            store.send(.fetchBanners)
            store.send(.fetchGiveaways(platform: .all))
            
        })
    }
}

#Preview {
    HomeView(store: Store(initialState: HomeFeature.State()) {
        HomeFeature()
    })
}
