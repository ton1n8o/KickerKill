// Copyright © 11.06.20 Antônio Carlos. All rights reserved.

@testable import KickerKill

final class MockPlayersListInteractorOutput: PlayersListInteractorOutput, HasInvocations {

    enum Invocation: FakeEquatable {

    }
    var invocations: [Invocation] = []

    // MARK: PlayersListInteractorOutput
    func didFetchPlayers(_ players: [Player]) {

    }

    func didFailToFetchPlayers(_ error: Error) {
        
    }
}
