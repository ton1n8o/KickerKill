//  Copyright © 2021 TNTStudios. All rights reserved.

import Foundation

struct MatchData {

    let team1: Team
    let team2: Team
    let gameType: GameType
    private(set) var team1AttackerGoals: Int = 0
    private(set) var team1DefenseGoals: Int = 0
    private(set) var team2AttackerGoals: Int = 0
    private(set) var team2DefenseGoals: Int = 0

    var team1Goals: Int {
        team1AttackerGoals + team1DefenseGoals
    }

    var team2Goals: Int {
        team2AttackerGoals + team2DefenseGoals
    }

    mutating func team1AttackerScoredGoal() {
        team1AttackerGoals += 1
    }

    mutating func team1DefenseScoredGoal() {
        team1DefenseGoals += 1
    }
}
