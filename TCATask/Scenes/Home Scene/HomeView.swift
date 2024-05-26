//
//  HomeView.swift
//  TCATask
//
//  Created by Ayman Atallah on 17/05/2024.
//

import SwiftUI

struct HomeView: View {
    @State var models: [Giveaway]
    @State var selectedGener: GameGenere = .all
    var body: some View {
        NavigationView {
//            Spacer()
            ScrollView(.vertical) {
                VStack {
                    Spacer(minLength: .init(10))
                    BannerView(giveaways: models)
                    Spacer()
                    TabsView(tabs: GameGenere.allCases, currentSelection: .all) { item in
                        print("************", item)
                    }
                    ForEach(models) { model in
                        GiveawayCardView(model: model)
                    }
                    .frame(width: 350, height: 350)
                    .padding(.top, 10)
                }
                Spacer()
                    .background(.red)
            }
            .navigationTitle("Testing")
        }
    }
    func updateGeneres() {
        print("CURRENT GENERE FROM PARENT: ", selectedGener)
    }
}

#Preview {
    HomeView(models: Giveaway.samples)
}
