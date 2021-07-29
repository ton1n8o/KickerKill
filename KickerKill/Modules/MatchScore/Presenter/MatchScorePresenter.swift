//  Copyright © 2021 TNTStudios. All rights reserved.

final class MatchScorePresenter: MatchScoreViewOutput, MatchScoreInteractorOutput {

    weak var view: MatchScoreViewInput?
    var interactor: MatchScoreInteractorInput!
    var router: MatchScoreRouterInput!
    private let matchViewData: MatchViewDataModel

    init(_ matchViewData: MatchViewDataModel) {
        self.matchViewData = matchViewData
    }

    deinit {
        print("\(String(describing: self)) >>> GONE" )
    }

    // MARK: - MatchScoreViewOutput

    func viewIsReady() {

        let matchScoreDataModel = MatchScoreDataModel(
            team1Goals: matchViewData.team1Goals,
            team2Goals: matchViewData.team2Goals,
            team1AttackerGoals: matchViewData.matchScore.team1Attacker,
            team1DefenseGoals: matchViewData.matchScore.team1Defense,
            team2AttackerGoals: matchViewData.matchScore.team2Attacker,
            team2DefenseGoals: matchViewData.matchScore.team2Defense,
            team1AttackerName: matchViewData.team1AttackerName,
            team1DefenseName: matchViewData.team1DefenderName,
            team2AttackerName: matchViewData.team2AttackerName,
            team2DefenseName: matchViewData.team2DefenderName
        )

        view?.update(with: matchScoreDataModel)
    }

    func newGame() {
        router.newGame()
    }

    // MARK: - MatchScoreInteractorOutput

}


struct MatchScoreDataModel {

    let team1Goals: Int 
    let team2Goals: Int

    let team1AttackerGoals: Int
    let team1DefenseGoals: Int
    let team2AttackerGoals: Int
    let team2DefenseGoals: Int

    let team1AttackerName: String
    let team1DefenseName: String
    let team2AttackerName: String
    let team2DefenseName: String

}
