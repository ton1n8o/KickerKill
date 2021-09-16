// Copyright © 11.06.20 Antônio Carlos. All rights reserved.

import XCTest
@testable import KickerKill

final class PlayersListPresenterTests: XCTestCase {

    var sut: PlayersListPresenter!
    var router: MockPlayersListRouterInput!
    var interactor: MockPlayersListInteractorInput!
    var view: MockPlayersListViewInput!

    override func setUp() {
        super.setUp()

        router = MockPlayersListRouterInput()
        interactor = MockPlayersListInteractorInput()
        view = MockPlayersListViewInput()

        sut = PlayersListPresenter()
        sut.router = router
        sut.interactor = interactor
        sut.view = view
    }

    override func tearDown() {
        router = nil
        interactor = nil
        view = nil
        sut = nil

        super.tearDown()
    }

    func test_DidSelectPlayer_One_Player() {

        // Arrange
        let player = Player(id: "id", name: "Marco Souza", email: "email@email.com")
        let expectedModel = PlayersListViewDataModel(team1Initials: ("M", nil),
                                                     team2Initials: (nil, nil),
                                                     startGameEnabled: false,
                                                     gameType: nil,
                                                     nextPlayerToBeSelected: .secondPlayer)

        // Act
        sut.didSelectPlayer(player)

        // Assert
        view.checkInvocations([.updateWithDataModel(expectedModel)])
    }

    func test_DidSelectPlayer_Two_Players() {

        // Arrange
        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
                       Player(id: "id2", name: "Pedro", email: "email@email.com")
        ]
        let expectedModel1 = PlayersListViewDataModel(
            team1Initials: ("M", nil),
            team2Initials: (nil, nil),
            startGameEnabled: false,
            gameType: nil,
            nextPlayerToBeSelected: .secondPlayer
        )
        let expectedModel2 = PlayersListViewDataModel(
            team1Initials: ("M", nil),
            team2Initials: ("P", nil),
            startGameEnabled: false,
            gameType: nil,
            nextPlayerToBeSelected: .thirdPlayer
        )

        // Act
        players.forEach {
            sut.didSelectPlayer($0)
        }

        // Assert
        view.checkInvocations([.updateWithDataModel(expectedModel1),
                               .updateWithDataModel(expectedModel2)])
    }

//    func test_DidSelectPlayer_Three_Players() {
//
//        // Arrange
//        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
//                       Player(id: "id2", name: "Pedro", email: "email@email.com"),
//                       Player(id: "id3", name: "Rodrigo", email: "email@email.com")
//        ]
//        let expectedModel1 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: (nil, nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel2 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: ("P", nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel3 = PlayersListViewDataModel(
//            team1Initials: ("M", "R"),
//            team2Initials: ("P", nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//
//        // Act
//        players.forEach {
//            sut.didSelectPlayer($0)
//        }
//
//        // Assert
//        view.checkInvocations([.updateWithDataModel(expectedModel1),
//                               .updateWithDataModel(expectedModel2),
//                               .updateWithDataModel(expectedModel3)])
//    }
//
//    func test_DidSelectPlayer_Four_Players() {
//
//        // Arrange
//        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
//                       Player(id: "id2", name: "Pedro", email: "email@email.com"),
//                       Player(id: "id3", name: "Rodrigo", email: "email@email.com"),
//                       Player(id: "id4", name: "Carlos", email: "email@email.com")
//        ]
//        let expectedModel1 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: (nil, nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel2 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: ("P", nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel3 = PlayersListViewDataModel(
//            team1Initials: ("M", "R"),
//            team2Initials: ("P", nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel4 = PlayersListViewDataModel(
//            team1Initials: ("M", "R"),
//            team2Initials: ("P", "C"),
//            startGameEnabled: false,
//            gameType: nil
//        )
//
//        // Act
//        players.forEach {
//            sut.didSelectPlayer($0)
//        }
//
//        // Assert
//        view.checkInvocations([.updateWithDataModel(expectedModel1),
//                               .updateWithDataModel(expectedModel2),
//                               .updateWithDataModel(expectedModel3),
//                               .updateWithDataModel(expectedModel4)])
//    }
//
//    func test_DidSelectPlayer_More_Than_Four_Players() {
//
//        // Arrange
//        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
//                       Player(id: "id2", name: "Pedro", email: "email@email.com"),
//                       Player(id: "id3", name: "Rodrigo", email: "email@email.com"),
//                       Player(id: "id4", name: "Carlos", email: "email@email.com"),
//                       Player(id: "id5", name: "Joao", email: "email@email.com")
//        ]
//        let expectedModel1 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: (nil, nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel2 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: ("P", nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel3 = PlayersListViewDataModel(
//            team1Initials: ("M", "R"),
//            team2Initials: ("P", nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel4 = PlayersListViewDataModel(
//            team1Initials: ("M", "R"),
//            team2Initials: ("P", "C"),
//            startGameEnabled: false,
//            gameType: nil
//        )
//
//        // Act
//        players.forEach {
//            sut.didSelectPlayer($0)
//        }
//
//        // Assert
//        view.checkInvocations([.updateWithDataModel(expectedModel1),
//                               .updateWithDataModel(expectedModel2),
//                               .updateWithDataModel(expectedModel3),
//                               .updateWithDataModel(expectedModel4)])
//    }
//
//    func test_When_Player_Added_Dont_Add_Again() {
//
//        // Arrange
//        let player = Player(id: "id", name: "Marco Souza", email: "email@email.com")
//        let expectedModel1 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: (nil, nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//
//        // Act
//        sut.didSelectPlayer(player)
//        sut.didSelectPlayer(player) // would be added to team2
//
//        // Assert
//        view.checkInvocations([.updateWithDataModel(expectedModel1)])
//    }
//
//    func test_When_Player_Added_Dont_Add_Again_To_Second_Team() {
//
//        // Arrange
//        let player1 = Player(id: "id", name: "Marco Souza", email: "email@email.com")
//        let player2 = Player(id: "id_2", name: "Souza F", email: "email@email.com")
//
//        let expectedModel1 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: (nil, nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel2 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: ("S", nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//
//        // Act
//        sut.didSelectPlayer(player1)
//        sut.didSelectPlayer(player2)
//
//        sut.didSelectPlayer(player2) // would be added to team1
//
//        // Assert
//        view.checkInvocations([.updateWithDataModel(expectedModel1),
//                               .updateWithDataModel(expectedModel2)])
//
//    }
//
//    func test_Remove_Players() {
//
//        // Arrange
//        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
//                       Player(id: "id2", name: "Pedro", email: "email@email.com"),
//                       Player(id: "id3", name: "Rodrigo", email: "email@email.com"),
//                       Player(id: "id4", name: "Carlos", email: "email@email.com")
//        ]
//
//        let expectedModel1 = PlayersListViewDataModel(
//            team1Initials: (nil, "R"),
//            team2Initials: ("P", "C"),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel2 = PlayersListViewDataModel(
//            team1Initials: (nil, "R"),
//            team2Initials: (nil, "C"),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel3 = PlayersListViewDataModel(
//            team1Initials: (nil, nil),
//            team2Initials: (nil, "C"),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel4 = PlayersListViewDataModel(
//            team1Initials: (nil, nil),
//            team2Initials: (nil, nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//
//        players.forEach {
//            sut.didSelectPlayer($0)
//        }
//        view.clearInvocations()
//
//        // Act
//        sut.removePlayer(at: .firstPlayer)
//        sut.removePlayer(at: .secondPlayer)
//        sut.removePlayer(at: .thirdPlayer)
//        sut.removePlayer(at: .forthPlayer)
//
//        // Assert
//        view.checkInvocations([.updateWithDataModel(expectedModel1),
//                               .updateWithDataModel(expectedModel2),
//                               .updateWithDataModel(expectedModel3),
//                               .updateWithDataModel(expectedModel4)])
//    }
//
//    func test_ViewIsReady_Updates_Default_GameType() {
//
//        // Arrange
//        let expectedModel1 = PlayersListViewDataModel(
//            team1Initials: (nil, nil),
//            team2Initials: (nil, nil),
//            startGameEnabled: false,
//            gameType: .goalBased(totalGoals: 5)
//        )
//
//        // Act
//        sut.viewIsReady()
//
//        // Assert
//        view.checkInvocations([.updateWithDataModel(expectedModel1)])
//    }
//
//    func test_DidSelectGameType() {
//
//        // Arrange
//        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
//                       Player(id: "id2", name: "Pedro", email: "email@email.com")
//        ]
//        let expectedModel1 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: (nil, nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel2 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: ("P", nil),
//            startGameEnabled: false,
//            gameType: nil
//        )
//        let expectedModel3 = PlayersListViewDataModel(
//            team1Initials: ("M", nil),
//            team2Initials: ("P", nil),
//            startGameEnabled: true,
//            gameType: .goalBased(totalGoals: 5)
//        )
//
//        // Act
//        sut.didSelectPlayer(players.first!)
//        sut.didSelectPlayer(players.last!)
//
//        sut.didSelectGameType(.goalBased(totalGoals: 5))
//
//        // Assert
//        view.checkInvocations([.updateWithDataModel(expectedModel1),
//                               .updateWithDataModel(expectedModel2),
//                               .updateWithDataModel(expectedModel3)])
//    }
}
