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
    private(set) var remainingSeconds: Int = 0

    mutating func oneSecPasst() {
        remainingSeconds -= 1
    }

    var team1Goals: Int {
        team1AttackerGoals + team1DefenseGoals
    }

    var team2Goals: Int {
        team2AttackerGoals + team2DefenseGoals
    }

    mutating func team1AttackerScoredGoal() {
        scoreGoal( { team1AttackerGoals += 1 } )
    }

    private func scoreGoal(_ addGoal: () -> ()) {
        guard !matchIsOver else { return }
        addGoal()
    }

    mutating func team1DefenseScoredGoal() {
        scoreGoal( { team1DefenseGoals += 1 } )
    }

    mutating func team2AttackerScoredGoal() {
        scoreGoal( { team2AttackerGoals += 1 } )
    }

    mutating func team2DefenseScoredGoal() {
        scoreGoal( { team2DefenseGoals += 1 } )
    }

    var matchIsOver: Bool {

        switch gameType {
        case .goalBased(let totalGoals):
            return totalGoals == team1Goals || totalGoals == team2Goals
        case .timeBased:
            return remainingSeconds < 1
        }
    }
}

extension MatchData {

    private static let minutesMultiplier = 60

    init(team1: Team, team2: Team, gameType: GameType) {
        self.team1 = team1
        self.team2 = team2
        self.gameType = gameType

        if case .timeBased(let minutes) = gameType {
            remainingSeconds = minutes * Self.minutesMultiplier
        }
    }
}
