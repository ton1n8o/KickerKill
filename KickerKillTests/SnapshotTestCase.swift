//  Copyright © 2020 TNTStudios. All rights reserved.

import XCTest

import FBSnapshotTestCase

@testable import KickerKill

final class SnapshotTestCase: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = false
    }

    func test_UpdateWithDataModel_2_Players() {

        let sut = loadViewController(
            fromStoryBoard: "PlayersList",
            andIdentifier: "PlayersListViewController") as! PlayersListViewController

        sut.output = MockPlayersListViewOutput()
        sut.loadViewIfNeeded()

        let viewDataModel = PlayersListViewDataModel(team1Initials: ("A", nil),
                                                     team2Initials: ("H", nil),
                                                     startGameEnabled: true)

        sut.updateWithDataModel(viewDataModel)

        FBSnapshotVerifyView(sut.view)
        FBSnapshotVerifyLayer(sut.view.layer)
    }

    func test_UpdateWithDataModel_4_Players() {

        let sut = loadViewController(
            fromStoryBoard: "PlayersList",
            andIdentifier: "PlayersListViewController") as! PlayersListViewController

        sut.output = MockPlayersListViewOutput()
        sut.loadViewIfNeeded()

        let viewDataModel = PlayersListViewDataModel(team1Initials: ("A", "R"),
                                                     team2Initials: ("H", "C"),
                                                     startGameEnabled: true)

        sut.updateWithDataModel(viewDataModel)

        FBSnapshotVerifyView(sut.view)
        FBSnapshotVerifyLayer(sut.view.layer)
    }

    func test_UpdateGameType_With_GoalBased() {

        let sut = loadViewController(
            fromStoryBoard: "PlayersList",
            andIdentifier: "PlayersListViewController") as! PlayersListViewController

        sut.output = MockPlayersListViewOutput()
        sut.loadViewIfNeeded()

        sut.updateGameType(.goalBased(totalGoals: 8))

        FBSnapshotVerifyView(sut.view)
        FBSnapshotVerifyLayer(sut.view.layer)
    }

    func test_UpdateGameType_With_TimeBased() {

        let sut = loadViewController(
            fromStoryBoard: "PlayersList",
            andIdentifier: "PlayersListViewController") as! PlayersListViewController

        sut.output = MockPlayersListViewOutput()
        sut.loadViewIfNeeded()

        sut.updateGameType(.timeBased(minutes: 10))

        FBSnapshotVerifyView(sut.view)
        FBSnapshotVerifyLayer(sut.view.layer)
    }
}
