//
//  GameGaveway.swift
//  TCATask
//
//  Created by Ayman Atallah on 17/05/2024.
//

import Foundation
import SwiftUI

struct Giveaway: Codable, Hashable, Identifiable, Equatable {
    var id : Int?
    var title : String?
    var worth : String?
    var thumbnail : String?
    var image : String?
    var description : String?
    var instructions : String?
    var open_giveaway_url : String?
    var published_date : String?
    var type : GiveawayType?
    var platforms : String?
    var end_date : String?
    var users : Int?
    var status : GiveawayStatus?
    var gamerpower_url : String?
    var open_giveaway : String?
    var isLiked: Bool? = false
}

enum GiveawayType: String, Codable {
    case dlc = "DLC"
    case game = "Game"
    case earlyAccess = "Early Access"
    case other = "Other"
}

enum GiveawayStatus: String, Codable {
    case active = "Active"
}


extension Giveaway {
    static let sample: Giveaway = .init(id: 1,
                                       title: "Call of Duty",
                                       image: "nyc",
                                       description: "Download Pinball FX - Super League Football (DLC) for free via Steam (or Epic Games Store) and keep it forever. Please note this DLC requires the base game Pinball FX (free-to-play) to enjoy this content.",
                                       platforms: "PC, Steam"
    )

    static let samples: [Giveaway] = .init([
        .init(id: 1,
              title: "Call of Duty",
              image: "nyc",
              description: "Download Pinball FX - Super League Football (DLC) for free via Steam (or Epic Games Store) and keep it forever. Please note this DLC requires the base game Pinball FX (free-to-play) to enjoy this content.",
              platforms: "PC, XBox"
        ),
        .init(id: 2,
              title: "Call of Thirty",
              image: "london",
              description: "Download Pinball FX - Super League Football (DLC) for free via Steam (or Epic Games Store) and keep it forever. Please note this DLC requires the base game Pinball FX (free-to-play) to enjoy this content.",
              platforms: "PC, Steam"
        ),
        .init(id: 3,
              title: "Minecraft",
              image: "barcelona",
              description: "Download Pinball FX - Super League Football (DLC) for free via Steam (or Epic Games Store) and keep it forever. Please note this DLC requires the base game Pinball FX (free-to-play) to enjoy this content.",
              platforms: "PC, Steam, Playstation"
        ),
        .init(id: 4,
              title: "Dragon Age: Inquisition - Game of the Year Edition Giveaway",
              image: "barcelona",
              description: "Download Pinball FX - Super League Football (DLC) for free via Steam (or Epic Games Store) and keep it forever. Please note this DLC requires the base game Pinball FX (free-to-play) to enjoy this content.",
              platforms: "PC, Steam"
        ),
        .init(id: 5,
              title: "Die by the Blade: Celestial Sword Steam Key Giveaway",
              image: "paris",
              description: "Download Pinball FX - Super League Football (DLC) for free via Steam (or Epic Games Store) and keep it forever. Please note this DLC requires the base game Pinball FX (free-to-play) to enjoy this content.",
              platforms: "xBox, Steam"
        )
    ])
}
