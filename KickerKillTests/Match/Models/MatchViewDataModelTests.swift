//  Copyright © 2021 TNTStudios. All rights reserved.

import XCTest
@testable import KickerKill

final class MatchViewDataModelTests: XCTestCase {

    func test_Team1_When_1_Player_Returns_Same_Name() {

        // Arrange
        let team1 = buildTeam("Marco", nil)
        let sut = MatchViewDataModel(showTimer: true, remainingMinutes: 0,
                                 team1: team1,
                                 team2: buildTeam("Foo", nil))

        // Act Assert
        XCTAssertEqual(sut.team1AttackerName, "Marco")
        XCTAssertEqual(sut.team1DefenderName, "Marco")
    }

    func test_Team2_When_1_Player_Returns_Same_Name() {

        // Arrange
        let team2 = buildTeam("Pedro", nil)
        let sut = MatchViewDataModel(showTimer: true, remainingMinutes: 0,
                                 team1: buildTeam("Foo", nil),
                                 team2: team2)

        // Act Assert
        XCTAssertEqual(sut.team2AttackerName, "Pedro")
        XCTAssertEqual(sut.team2DefenderName, "Pedro")
    }

    func test_When_2_Players_Return_Proper_Names() {

        // Arrange
        let team1 = buildTeam("Marco", "Antonio")
        let team2 = buildTeam("Rodrigo", "Stuart")

        let sut = MatchViewDataModel(showTimer: true,
                                 remainingMinutes: 5,
                                 team1: team1,
                                 team2: team2)

        // Act Assert
        XCTAssertEqual(sut.team1AttackerName, "Marco")
        XCTAssertEqual(sut.team1DefenderName, "Antonio")
        XCTAssertEqual(sut.team2AttackerName, "Rodrigo")
        XCTAssertEqual(sut.team2DefenderName, "Stuart")
    }
}

// MARK: - Helpers

private extension MatchViewDataModelTests {

    func buildTeam(_ namePlayer1: String, _ namePlayer2: String?) -> Team {

        let player1 = Player(id: "1",
                             name: namePlayer1,
                             email: "foo@gmail.com")

        var player2: Player?
        if let namePlayer2 = namePlayer2 {
            player2 = Player(id: "2",
                                 name: namePlayer2,
                                 email: "mar@gmail.com")
        }

        return Team(player1: player1, player2: player2)
    }
}
