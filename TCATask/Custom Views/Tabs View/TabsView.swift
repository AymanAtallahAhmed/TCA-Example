//
//  TabsView.swift
//  TCATask
//
//  Created by Ayman Atallah on 18/05/2024.
//

import SwiftUI

struct TabsView<T: SelectableTabs>: View {
    @State var tabs: [T]
    @State var currentSelection: T
    var didSelectTap: ((T) -> Void)? = nil
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView.init(.horizontal, showsIndicators: false) {
            HStack(alignment: .center) {
                ForEach(tabs, id: \.id) { item in
                    Button {
                        self.didSelectTap?(item)
                        self.currentSelection = item
                        reloadData()
                    } label: {
                        Text(item.tabText)
                            .foregroundStyle(item == currentSelection ? textColor() : .gray)
                            .font(item == currentSelection ? .system(size: 22) : .system(size: 20))
                            
                    }
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 4))
                }
            }
        }
        .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
     func reloadData() {
        self.tabs = tabs
    }

    func textColor() -> Color {
        colorScheme == .dark ? .white : .black
    }
}

#Preview {
    TabsView<Platform>(tabs: Platform.allCases, currentSelection: .all)
}

extension String: Identifiable {
    public var id: ObjectIdentifier {
        ObjectIdentifier.init(Self.self)
    }
}
