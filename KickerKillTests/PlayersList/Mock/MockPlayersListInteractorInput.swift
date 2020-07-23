// Copyright © 11.06.20 Antônio Carlos. All rights reserved.

@testable import KickerKill

final class MockPlayersListInteractorInput: PlayersListInteractorInput, HasInvocations {

    enum Invocation: FakeEquatable {

    }
    var invocations: [Invocation] = []

    // MARK: PlayersListInteractorInput
    func fetchAllPlayers(limit: Int, firstPage: Bool) {
        
    }
}
