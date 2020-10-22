// Copyright © 11.06.20 Antônio Carlos. All rights reserved.

@testable import KickerKill

final class MockPlayersListViewInput: PlayersListViewInput, HasInvocations {

    enum Invocation: FakeEquatable {
        case showError(PlayerViewErrors)
        case updateWithDataModel(PlayersListViewDataModel)
        case updateGameType(GameType)
    }

    var invocations: [Invocation] = []


    func showPlayers(_ players: [Player]) {

    }

    func showError(error: PlayerViewErrors) {
        invocations.append(.showError(error))
    }

    func updateWithDataModel(_ dataModel: PlayersListViewDataModel) {
        invocations.append(.updateWithDataModel(dataModel))
    }

    func updateGameType(_ gameType: GameType) {
        invocations.append(.updateGameType(gameType))
    }
}
