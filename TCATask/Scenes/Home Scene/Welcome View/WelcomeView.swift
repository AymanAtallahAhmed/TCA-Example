//
//  WelcomeView.swift
//  TCATask
//
//  Created by Ayman Atallah on 26/05/2024.
//

import SwiftUI

struct WelcomeView: View {
    var title: String
    var userName: String
    var userImage: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("👋")
                    Spacer()
                    Text("Hello, \(userName)")
                }
                .font(.system(size: 14, weight: .semibold))
                Spacer()
                Image(systemName: userImage)
                    .frame(width: 40, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.blue, lineWidth: 2)
                    )
            }
            Text(title)
                .font(.system(size: 32, weight: .bold))
                .lineLimit(2)
        }
        .padding()
    }
}

#Preview {
    WelcomeView(title: "Explore Games Giveaways",
                userName: "Ayman",
                userImage: "figure.run")
}
