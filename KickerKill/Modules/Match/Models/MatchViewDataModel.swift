//  Copyright © 2021 TNTStudios. All rights reserved.

struct MatchViewDataModel {

    let showTimer: Bool
    private let matchData: MatchData

    init(showTimer: Bool, matchData: MatchData) {
        self.showTimer = showTimer
        self.matchData = matchData
    }

    var team1AttackerName: String {
        matchData.team1.player1?.name ?? ""
    }

    var team1DefenderName: String {
        matchData.team1.player2?.name ?? team1AttackerName
    }

    var team1Goals: Int {
        matchData.team1Goals
    }

    var team2Goals: Int {
        matchData.team2Goals
    }

    var team2AttackerName: String {
        matchData.team2.player1?.name ?? ""
    }

    var team2DefenderName: String {
        matchData.team2.player2?.name ?? team2AttackerName
    }

    var matchIsOver: Bool {
        matchData.matchIsOver
    }

    var timerText: String {
        let min = matchData.remainingSeconds / 60
        let sec = matchData.remainingSeconds % 60
        return String(format: "%02d:%02d", min, sec)
    }

    var matchScore: PlayerGoals {
        .init(team1Attacker: matchData.team1AttackerGoals,
              team1Defense: matchData.team1DefenseGoals,
              team2Attacker: matchData.team2AttackerGoals,
              team2Defense: matchData.team2DefenseGoals)
    }

}

struct PlayerGoals {
    let team1Attacker: Int
    let team1Defense: Int
    let team2Attacker: Int
    let team2Defense: Int

}
