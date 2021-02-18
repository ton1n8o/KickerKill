//  Copyright © 2021 TNTStudios. All rights reserved.

import XCTest
@testable import KickerKill

final class MatchPresenterTests: XCTestCase {

    var sut: MatchPresenter!
    var router: MockMatchRouterInput!
    var interactor: MockMatchInteractorInput!
    var view: MockMatchViewInput!

    override func setUp() {
        super.setUp()

        router = MockMatchRouterInput()
        interactor = MockMatchInteractorInput()
        view = MockMatchViewInput()

        let team1 = Team()
        let team2 = Team()
        let gameType: GameType = .timeBased(minutes: 5)

        let matchData = MatchData(team1: team1,
                                  team2: team2,
                                  gameType: gameType)

        sut = MatchPresenter(matchData: matchData)
        sut.router = router
        sut.interactor = interactor
        sut.view = view
    }

    private var matchData: MatchData {

        let team1 = Team()
        let team2 = Team()
        return MatchData(team1: team1, team2: team2, gameType: .goalBased(totalGoals: 5))
    }

    override func tearDown() {
        router = nil
        interactor = nil
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


    func test_ViewIsReady_With_GoalBasedGame() {

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

}

// MARK: - Helpers

private extension MatchPresenterTests {

    private var matchDataTimeBased: MatchData {

        let team1 = Team()
        let team2 = Team()
        let gameType: GameType = .timeBased(minutes: 5)

        return MatchData(team1: team1,
                         team2: team2,
                         gameType: gameType)
    }

    private var matchDataGoalBased: MatchData {

        let team1 = Team()
        let team2 = Team()
        let gameType: GameType = .goalBased(totalGoals: 5)

        return MatchData(team1: team1,
                         team2: team2,
                         gameType: gameType)
    }
}
