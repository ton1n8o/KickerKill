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

    }

    // MARK: - MatchInteractorOutput

}
