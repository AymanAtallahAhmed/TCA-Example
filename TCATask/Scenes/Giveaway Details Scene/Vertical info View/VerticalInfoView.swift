//
//  VerticalInfoView.swift
//  TCATask
//
//  Created by Ayman Atallah on 26/05/2024.
//

import SwiftUI

struct VerticalInfoView: View {
    let imageName: String
    let info: String
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: imageName)
            Spacer()
            Text(info)
                .font(.system(size: 16, weight: .bold))
        }
        .font(.title)
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}

#Preview {
    VerticalInfoView(imageName: "", info: "")
}
