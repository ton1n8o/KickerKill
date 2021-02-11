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

        // por tempo ou por goal
        let dataModel = MatchViewDataModel(showTimer: matchData.gameType == GameType.timeBased,
                                           remainingMinutes: 5, // pode nao ser usado assim
                                           team1: matchData.team1,
                                           team2: matchData.team2)

        view?.updateMatchUI(with: dataModel)
    }

    // MARK: - MatchInteractorOutput

}
