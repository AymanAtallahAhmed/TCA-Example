//
//  DescriptionView.swift
//  TCATask
//
//  Created by Ayman Atallah on 26/05/2024.
//

import SwiftUI

struct DescriptionView: View {
    let title: String
    let description: String
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(colorScheme == .dark ? .white : .black)
            Spacer()
            Text(description)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    DescriptionView(title: "Platforms", description: "Pc, Steam")
}
