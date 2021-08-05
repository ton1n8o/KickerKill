//  Copyright © 2021 TNTStudios. All rights reserved.

import XCTest
@testable import KickerKill

final class MatchDataTests: XCTestCase {

    func test_team1AttackerScoredGoal_Cant_Go_Beyond_Goals_Limit() {

        // Arrange
        let expected = 5
        
        let team1 = Team()
        let team2 = Team()
        var sut = MatchData(
            team1: team1,
            team2: team2,
            gameType: .goalBased(totalGoals: expected)
        )

        // Act
        (1 ... 6).forEach { _ in
            sut.team1AttackerScoredGoal()
        }

        // Assert
        XCTAssertEqual(sut.team1Goals, expected)
    }

    func test_team1DefenseScoredGoal_Cant_Go_Beyond_Goals_Limit() {

        // Arrange
        let expected = 5

        let team1 = Team()
        let team2 = Team()
        var sut = MatchData(
            team1: team1,
            team2: team2,
            gameType: .goalBased(totalGoals: expected)
        )

        // Act
        (1 ... 6).forEach { _ in
            sut.team1DefenseScoredGoal()
        }

        // Assert
        XCTAssertEqual(sut.team1Goals, expected)
    }

    func test_team2AttackerScoredGoal_Cant_Go_Beyond_Goals_Limit() {

        // Arrange
        let expected = 5

        let team1 = Team()
        let team2 = Team()
        var sut = MatchData(
            team1: team1,
            team2: team2,
            gameType: .goalBased(totalGoals: expected)
        )

        // Act
        (1 ... 6).forEach { _ in
            sut.team2AttackerScoredGoal()
        }

        // Assert
        XCTAssertEqual(sut.team2Goals, expected)
    }

    func test_team2DefenseScoredGoal_Cant_Go_Beyond_Goals_Limit() {

        // Arrange
        let expected = 5

        let team1 = Team()
        let team2 = Team()
        var sut = MatchData(
            team1: team1,
            team2: team2,
            gameType: .goalBased(totalGoals: expected)
        )

        // Act
        (1 ... 6).forEach { _ in
            sut.team2DefenseScoredGoal()
        }

        // Assert
        XCTAssertEqual(sut.team2Goals, expected)
    }

    func test_remainingSeconds_Properly_Multiplied_By_60() {

        // Arrange
        let minutes = Int.random(in: 1...10)
        let expected = minutes * 60

        let team1 = Team()
        let team2 = Team()
        let sut = MatchData(
            team1: team1,
            team2: team2,
            gameType: .timeBased(minutes: minutes)
        )

        // Act
        let secondsRemaining = sut.remainingSeconds

        // Assert
        XCTAssertEqual(secondsRemaining, expected)
    }

}
