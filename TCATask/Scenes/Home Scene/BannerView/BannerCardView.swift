//
//  BannerCardView.swift
//  TCATask
//
//  Created by Ayman Atallah on 17/05/2024.
//

import SwiftUI

struct BannerCardView: View {
    @State var model: Gaveway
    var body: some View {
        ZStack {
            Image(model.image ?? "")
                .resizable()
                .scaledToFit()
                .foregroundColor(.blue)
            Color.init(red: 0, green: 0, blue: 0, opacity: 0.5)
            VStack(alignment: .leading) {
                Text(model.title!)
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                Text(model.description!)
                    .foregroundStyle(.white)
                    .font(.system(size: 16, weight: .medium))
            }
//            .background(.green)
            .padding()
        }
        
    }
}

#Preview {
    BannerCardView(model: .sample)
        .previewLayout(.fixed(width: 400, height: 300))
}
