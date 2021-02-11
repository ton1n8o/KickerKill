//  Copyright © 2021 TNTStudios. All rights reserved.

import XCTest
@testable import KickerKill

final class MatchPresenterTests: XCTestCase {

    var sut: MatchPresenter!
//    var router: MatchPresenterRouterInput!
//    var interactor: MatchPresenterInteractorInput!
    var view: MockMatchViewInput!

    override func setUp() {
        super.setUp()

//        router = MatchPresenterRouterInput()
//        interactor = MatchPresenterInteractorInput()
        view = MockMatchViewInput()

        sut = MatchPresenter(matchData: matchDataTimeBased)
//        sut.router = router
//        sut.interactor = interactor
        sut.view = view
    }

    override func tearDown() {
//        router = nil
//        interactor = nil
        view = nil
        sut = nil

        super.tearDown()
    }

    func test_ViewIsReady_With_TimeBasedGame() {

        // Arrange
        let dataModel = MatchViewDataModel(showTimer: true,
                                           remainingMinutes: 5,
                                           team1: matchDataTimeBased.team1,
                                           team2: matchDataTimeBased.team2)

        // Act
        sut.viewIsReady()

        // Assert
        view.checkInvocations([.updateMatchUI(dataModel)])
    }

    func Xtest_ViewIsReady_With_GoalBasedGame() {

        // Arrange
        let dataModel = MatchViewDataModel(showTimer: false,
                                           remainingMinutes: 0,
                                           team1: matchDataGoalBased.team1,
                                           team2: matchDataGoalBased.team2)

        sut = MatchPresenter(matchData: matchDataGoalBased)
        sut.view = self.view

        // Act
        sut.viewIsReady()

        // Assert
        view.checkInvocations([.updateMatchUI(dataModel)])
    }

    private var matchDataTimeBased: MatchData {

        let team1 = Team()
        let team2 = Team()
        let gameType: GameType = .timeBased

        return MatchData(team1: team1,
                         team2: team2,
                         gameType: gameType)
    }

    private var matchDataGoalBased: MatchData {

        let team1 = Team()
        let team2 = Team()
        let gameType: GameType = .goalBased

        return MatchData(team1: team1,
                         team2: team2,
                         gameType: gameType)
    }

}
