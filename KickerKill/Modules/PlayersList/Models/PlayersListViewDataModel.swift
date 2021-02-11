//  Copyright © 2020 TNTStudios. All rights reserved.

enum GameType {

    case timeBased
    case goalBased
}

struct PlayersListViewDataModel {

    let team1Initials: (String?, String?)
    let team2Initials: (String?, String?)
    let startGameEnabled: Bool
    let gameType: GameType?
    let gameTypeUnit: Int
}

extension PlayersListViewDataModel {

    init(team1Initials: (String?, String?),
         team2Initials: (String?, String?),
         startGameEnabled: Bool,
         gameType: GameType?) {

        self.team1Initials = team1Initials
        self.team2Initials = team2Initials
        self.startGameEnabled = startGameEnabled
        self.gameType = gameType
        self.gameTypeUnit = 5
    }
}
