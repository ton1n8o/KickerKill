//  Copyright © 2020 TNTStudios. All rights reserved.

final class MatchPresenter: MatchViewOutput, MatchInteractorOutput {

    weak var view: MatchViewInput?
    var interactor: MatchInteractorInput!
    var router: MatchRouterInput!

    private var matchData: MatchData

    init(matchData: MatchData) {
        self.matchData = matchData
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

    func team1AttackerScoredGoal() {
        matchData.team1AttackerScoredGoal()
        view?.updateMatchUI(with: matchViewDataModel)
    }

    func team1DefenseScoredGoal() {
        matchData.team1DefenseScoredGoal()
        view?.updateMatchUI(with: matchViewDataModel)
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
