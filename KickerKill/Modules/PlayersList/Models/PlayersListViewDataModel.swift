//  Copyright © 2020 TNTStudios. All rights reserved.

enum GameType {
    case timeBased(minutes: Int)
    case goalBased(totalGoals: Int)
}

struct PlayersListViewDataModel {
    let team1Initials: (String?, String?)
    let team2Initials: (String?, String?)
    let startGameEnabled: Bool
    let gameType: GameType?
    let nextPlayerToBeSelected: PlayerPosition?
}
