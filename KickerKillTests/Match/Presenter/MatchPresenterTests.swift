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
                                           matchData: matchDataTimeBased)

        // Act
        sut.viewIsReady()

        // Assert
        view.checkInvocations([.updateMatchUI(dataModel)])
    }


    func test_ViewIsReady_With_GoalBasedGame() {

        // Arrange
        let dataModel = MatchViewDataModel(showTimer: false,
                                           remainingMinutes: 0,
                                           matchData: matchDataGoalBased)

        sut = MatchPresenter(matchData: matchDataGoalBased)
        sut.view = self.view

        // Act
        sut.viewIsReady()

        // Assert
         view.checkInvocations([.updateMatchUI(dataModel)])
    }

    func test_team1AttackerScoredGoal_Adds_a_Goal() {

        // Arrange
        let dataModelExpected = MatchViewDataModel(showTimer: false,
                                                   remainingMinutes: 0,
                                                   matchData: matchDataWith(goals: 1))

        sut = MatchPresenter(matchData: matchDataWith(goals: 0))
        sut.view = self.view

        // Act
        sut.team1AttackerScoredGoal()

        // Assert
        view.checkInvocations([.updateMatchUI(dataModelExpected)])
    }

    func test_team1DefenseScoredGoal_Adds_a_Goal() {

        // Arrange
        let dataModelExpected = MatchViewDataModel(showTimer: false,
                                                   remainingMinutes: 0,
                                                   matchData: matchDataWith(goals: 0, 1))

        sut = MatchPresenter(matchData: matchDataWith(goals: 0, 0))
        sut.view = self.view

        // Act
        sut.team1DefenseScoredGoal()

        // Assert
        view.checkInvocations([.updateMatchUI(dataModelExpected)])
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

    private func matchDataWith(goals: Int...) -> MatchData {

        let team1 = Team()
        let team2 = Team()

        switch goals.count {
        case 1:
            return MatchData(team1: team1,
                             team2: team2,
                             gameType: .goalBased(totalGoals: 5),
                             team1AttackerGoals: goals[0])
        case 2:
            return MatchData(team1: team1,
                             team2: team2,
                             gameType: .goalBased(totalGoals: 5),
                             team1AttackerGoals: goals[0],
                             team1DefenseGoals: goals[1])
        case 3:
            return MatchData(team1: team1,
                             team2: team2,
                             gameType: .goalBased(totalGoals: 5),
                             team1AttackerGoals: goals[0],
                             team1DefenseGoals: goals[1],
                             team2AttackerGoals: goals[2])
        case 4:
            return MatchData(team1: team1,
                             team2: team2,
                             gameType: .goalBased(totalGoals: 5),
                             team1AttackerGoals: goals[0],
                             team1DefenseGoals: goals[1],
                             team2AttackerGoals: goals[2],
                             team2DefenseGoals: goals[3])
        default:
            fatalError("number of records beyond the supported limit.")
        }
    }
}
