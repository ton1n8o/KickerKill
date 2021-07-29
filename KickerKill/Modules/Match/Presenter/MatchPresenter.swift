//  Copyright © 2020 TNTStudios. All rights reserved.

import Foundation

enum TeamPlayers {
    case team1Attack
    case team1Defense
    case team2Attack
    case team2Defense
}

final class MatchPresenter: MatchViewOutput, MatchInteractorOutput {

    weak var view: MatchViewInput?
    var interactor: MatchInteractorInput!
    var router: MatchRouterInput!
    var moduleOutput: MatchModuleOutput!
    private var timer: Timer!

    private var matchData: MatchData

    init(matchData: MatchData) {
        self.matchData = matchData


        // TODO: Pode ser que mover essa logica para dentro do Match data seja uma boa... vamos pensar nisso.


        if case .timeBased(let minutes) = matchData.gameType {
            var remainingSeconds = 15
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
                print("\(#function ) >>> \(timer.timeInterval)")
                remainingSeconds -= 1
                if remainingSeconds < 1 {
                    timer.invalidate()
                    // update ui with seconds remaining.
                    // view?.updateTimerWith(remainingSeconds)
                }
                // TODO: view?.updateTimerWith(remainingSeconds)
            })
        }
    }

    deinit {
        print("\(String(describing: self)) >>> GONE" )
    }

    // MARK: - MatchViewOutput

    func viewIsReady() {
        view?.updateMatchUI(with: matchViewDataModel)
    }

    private var matchViewDataModel: MatchViewDataModel {

        return MatchViewDataModel(
            showTimer: gameTypeData.showTimer,
            remainingMinutes: gameTypeData.remainingMinutes,
            matchData: matchData
        )
    }

    func playerScoredGoal(teamPlayer: TeamPlayers) {

        switch teamPlayer {
        case .team1Attack:
            matchData.team1AttackerScoredGoal()
        case .team1Defense:
            matchData.team1DefenseScoredGoal()
        case .team2Attack:
            matchData.team2AttackerScoredGoal()
        case .team2Defense:
            matchData.team2DefenseScoredGoal()
        }

        view?.updateMatchUI(with: matchViewDataModel)

        if matchViewDataModel.matchIsOver {
            router.dismiss {
                self.moduleOutput?.gameIsOver(self.matchViewDataModel)
            }
        }
    }

    private var gameTypeData: (showTimer: Bool, remainingMinutes: Int) {

        let showTimer: Bool
        let remainingMinutes: Int

        switch matchData.gameType {

        case .timeBased(let minutes):
            showTimer = true
            remainingMinutes = minutes

        case .goalBased:
            showTimer = false
            remainingMinutes = 0
        }

        return (showTimer, remainingMinutes)
    }

    // MARK: - MatchInteractorOutput

}
