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

        // Act
        sut.didSelectPlayer(player)

        // Assert
        view.checkInvocations([.showInitials(team1: ("M", nil), team2: (nil, nil)),
                               .startGame(enabled: false)])
    }

    func test_DidSelectPlayer_Two_Players() {

        // Arrange
        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
                       Player(id: "id2", name: "Pedro", email: "email@email.com")
        ]

        // Act
        players.forEach {
            sut.didSelectPlayer($0)
        }

        // Assert
        view.checkInvocations([.showInitials(team1: ("M", nil), team2: (nil, nil)),
                               .startGame(enabled: false),
                               .showInitials(team1: ("M", nil), team2: ("P", nil)),
                               .startGame(enabled: true)])
    }

    func test_DidSelectPlayer_Three_Players() {

        // Arrange
        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
                       Player(id: "id2", name: "Pedro", email: "email@email.com"),
                       Player(id: "id3", name: "Rodrigo", email: "email@email.com")
        ]

        // Act
        players.forEach {
            sut.didSelectPlayer($0)
        }

        // Assert
        view.checkInvocations([.showInitials(team1: ("M", nil), team2: (nil, nil)),
                               .startGame(enabled: false),
                               .showInitials(team1: ("M", nil), team2: ("P", nil)),
                               .startGame(enabled: true),
                               .showInitials(team1: ("M", "R"), team2: ("P", nil)),
                               .startGame(enabled: false)])
    }

    func test_DidSelectPlayer_Four_Players() {

        // Arrange
        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
                       Player(id: "id2", name: "Pedro", email: "email@email.com"),
                       Player(id: "id3", name: "Rodrigo", email: "email@email.com"),
                       Player(id: "id4", name: "Carlos", email: "email@email.com")
        ]

        // Act
        players.forEach {
            sut.didSelectPlayer($0)
        }

        // Assert
        view.checkInvocations([.showInitials(team1: ("M", nil), team2: (nil, nil)),
                               .startGame(enabled: false),
                               .showInitials(team1: ("M", nil), team2: ("P", nil)),
                               .startGame(enabled: true),
                               .showInitials(team1: ("M", "R"), team2: ("P", nil)),
                               .startGame(enabled: false),
                               .showInitials(team1: ("M", "R"), team2: ("P", "C")),
                               .startGame(enabled: true)])
    }

    func test_DidSelectPlayer_More_Than_Four_Players() {

        // Arrange
        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
                       Player(id: "id2", name: "Pedro", email: "email@email.com"),
                       Player(id: "id3", name: "Rodrigo", email: "email@email.com"),
                       Player(id: "id4", name: "Carlos", email: "email@email.com"),
                       Player(id: "id5", name: "Joao", email: "email@email.com")
        ]

        // Act
        players.forEach {
            sut.didSelectPlayer($0)
        }

        // Assert
        view.checkInvocations([.showInitials(team1: ("M", nil), team2: (nil, nil)),
                               .startGame(enabled: false),
                               .showInitials(team1: ("M", nil), team2: ("P", nil)),
                               .startGame(enabled: true),
                               .showInitials(team1: ("M", "R"), team2: ("P", nil)),
                               .startGame(enabled: false),
                               .showInitials(team1: ("M", "R"), team2: ("P", "C")),
                               .startGame(enabled: true)])
    }

    func test_When_Player_Added_Dont_Add_Again() {

        // Arrange
        let player = Player(id: "id", name: "Marco Souza", email: "email@email.com")

        // Act
        sut.didSelectPlayer(player)
        sut.didSelectPlayer(player) // would be added to team2

        // Assert
        view.checkInvocations([.showInitials(team1: ("M", nil), team2: (nil, nil)),
                               .startGame(enabled: false)])

    }

    func test_When_Player_Added_Dont_Add_Again_To_Second_Team() {

        // Arrange
        let player1 = Player(id: "id", name: "Marco Souza", email: "email@email.com")
        let player2 = Player(id: "id_2", name: "Souza F", email: "email@email.com")

        // Act
        sut.didSelectPlayer(player1)
        sut.didSelectPlayer(player2)

        sut.didSelectPlayer(player2) // would be added to team1

        // Assert
        view.checkInvocations([.showInitials(team1: ("M", nil), team2: (nil, nil)),
                               .startGame(enabled: false),
                               .showInitials(team1: ("M", nil), team2: ("S", nil)),
                               .startGame(enabled: true)])

    }

    func test_Remove_Players() {

        // Arrange
        let players = [Player(id: "id", name: "Marco", email: "email@email.com"),
                       Player(id: "id2", name: "Pedro", email: "email@email.com"),
                       Player(id: "id3", name: "Rodrigo", email: "email@email.com"),
                       Player(id: "id4", name: "Carlos", email: "email@email.com")
        ]
        players.forEach {
            sut.didSelectPlayer($0)
        }
        view.clearInvocations()

        // Act
        sut.removePlayer(at: .firstPlayer)
        sut.removePlayer(at: .secondPlayer)
        sut.removePlayer(at: .thirdPlayer)
        sut.removePlayer(at: .forthPlayer)

        // Assert
        view.checkInvocations([.showInitials(team1: (nil, "R"), team2: ("P", "C")),
                               .startGame(enabled: false),
                               .showInitials(team1: (nil, "R"), team2: (nil, "C")),
                               .startGame(enabled: true),
                               .showInitials(team1: (nil, nil), team2: (nil, "C")),
                               .startGame(enabled: false),
                               .showInitials(team1: (nil, nil), team2: (nil, nil)),
                               .startGame(enabled: false)])
    }
}
