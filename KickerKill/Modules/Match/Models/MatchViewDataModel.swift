//  Copyright © 2021 TNTStudios. All rights reserved.

struct MatchViewDataModel {

    let showTimer: Bool
    let remainingMinutes: Int
    let team1: Team
    let team2: Team

    var team1AttackerName: String {
        team1.player1?.name ?? ""
    }

    var team1DefenderName: String {
        team1.player2?.name ?? team1AttackerName
    }

    var team2AttackerName: String {
        team2.player1?.name ?? ""
    }

    var team2DefenderName: String {
        team2.player2?.name ?? team2AttackerName
    }
}

