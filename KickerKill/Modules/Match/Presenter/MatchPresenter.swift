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
    private var gameTimer: Timer?
    private var matchData: MatchData

    init(matchData: MatchData) {
        self.matchData = matchData
        checkInitGameTimer()
    }

    private func checkInitGameTimer() {
        guard case .timeBased = matchData.gameType else { return }
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerTic)
    }

    private func timerTic(timer: Timer) {
        matchData.oneSecPasst()
        if matchData.matchIsOver {
            timer.invalidate()
        }
        view?.updateMatchUI(with: matchViewDataModel)
        handleMatchIsOver()
    }

    private func handleMatchIsOver() {
        guard matchViewDataModel.matchIsOver else { return }
        didEndMatch()
    }

    private func didEndMatch() {
        router.dismiss {
            self.moduleOutput?.gameIsOver(self.matchViewDataModel)
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
        let showTimer: Bool
        switch matchData.gameType {
        case .timeBased:
            showTimer = true
        case .goalBased:
            showTimer = false
        }
        return MatchViewDataModel(showTimer: showTimer, matchData: matchData)
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
        handleMatchIsOver()
    }

    func didPressPause() {
        gameTimer?.invalidate()
    }

    func resumeMatch() {
        checkInitGameTimer()
    }

    func endMatch() {
        didEndMatch()
    }

    // MARK: - MatchInteractorOutput

}
