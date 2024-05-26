//
//  TabsViewProtocol.swift
//  TCATask
//
//  Created by Ayman Atallah on 27/05/2024.
//

import Foundation

protocol SelectableRawRepresentable: RawRepresentable {
    var id: String { get }
    var tabText: String { get }
}


/// Main protocol that would work for the TabsView
///    - Note: This protocol should be confirmed by enums only.
 protocol SelectableTabs: SelectableRawRepresentable, Equatable {}


/// Platform is the needed enum for TabsView so it can work properly.
enum Platform: String, SelectableTabs, CaseIterable {
    var id: String { self.rawValue }

    var tabText: String {
        self.rawValue
    }

    case all
    case pc
    case steam
    case iOS = "ios"
    case android
}
