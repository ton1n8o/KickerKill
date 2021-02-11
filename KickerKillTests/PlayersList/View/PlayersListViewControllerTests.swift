// Copyright © 02.07.20 Antônio Carlos. All rights reserved.

import XCTest
@testable import KickerKill

final class PlayersListViewControllerTests: XCTestCase {

    var output: MockPlayersListViewOutput!
    var sut: PlayersListViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()

        output = MockPlayersListViewOutput()
        sut = loadViewController(
        fromStoryBoard: "PlayersList",
        andIdentifier: "PlayersListViewController") as? PlayersListViewController

        sut.output = output
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        output = nil
        try super.tearDownWithError()
    }

    func test_ViewDidLoad_Calls_ViewIsReady() {

        // Arrange
        output.clearInvocations()

        // Act
        sut.viewDidLoad()

        // Assert
        output.checkInvocations([.viewIsReady])
    }

    func test_Tap_Remove_firstPlayer_Calls_remove_firstPlayer() {

        // Arrange
        output.clearInvocations()

        // Act
        sut.buttonRemovePlayer1.sendActions(for: .touchUpInside)

        // Assert
        output.checkInvocations([.removePlayer(.firstPlayer)])
    }

    func test_DidChangeGameType_Updates_Presenter_GameType() {

        // Arrange
        sut.updateGameType(.goalBased, unitValue: 5)
        output.clearInvocations()

        // Act
        sut.didChangeGameType(UISwitch())

        // Assert
        output.checkInvocations([.didSelectGameType(.goalBased)])
    }

}
