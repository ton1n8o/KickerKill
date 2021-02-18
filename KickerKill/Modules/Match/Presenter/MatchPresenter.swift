//  Copyright © 2020 TNTStudios. All rights reserved.

final class MatchPresenter: MatchViewOutput, MatchInteractorOutput {

    weak var view: MatchViewInput?
    var interactor: MatchInteractorInput!
    var router: MatchRouterInput!

    private let matchData: MatchData

    init(matchData: MatchData) {
        self.matchData = matchData
    }

    // MARK: - MatchViewOutput

    func viewIsReady() {

        let matchDataModel = MatchViewDataModel(showTimer: gameTypeData.showTimer,
                                                remainingMinutes: gameTypeData.remainingMinutes,
                                                team1: matchData.team1,
                                                team2: matchData.team2)

        view?.updateMatchUI(with: matchDataModel)
    }

    private var gameTypeData: (showTimer: Bool, remainingMinutes: Int) {

        let showTimer: Bool
        let reaminingMinutes: Int

        if case .timeBased(let minutes) = matchData.gameType {
            showTimer = true
            reaminingMinutes = minutes
        } else {
            showTimer = false
            reaminingMinutes = 0
        }

        return (showTimer, reaminingMinutes)
    }

    // MARK: - MatchInteractorOutput

}
