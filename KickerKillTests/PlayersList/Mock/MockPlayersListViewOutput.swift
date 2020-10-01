// Copyright © 11.06.20 Antônio Carlos. All rights reserved.

@testable import KickerKill

final class MockPlayersListViewOutput: PlayersListViewOutput, HasInvocations {

    enum Invocation: FakeEquatable {
        case viewIsReady
        case removePlayer(PlayerPosition)
    }
    var invocations: [Invocation] = []

    // MARK: PlayersListViewOutput

    func viewIsReady() {
        invocations.append(.viewIsReady)
    }

    func didSelectPlayer(_ player: Player) {
        
    }

    func removePlayer(at: PlayerPosition) {
        invocations.append(.removePlayer(at))
    }

    func didSelectGameType(_ gameType: GameType?) {

    }
}
