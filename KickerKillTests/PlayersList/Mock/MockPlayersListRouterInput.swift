// Copyright © 11.06.20 Antônio Carlos. All rights reserved.

@testable import KickerKill

final class MockPlayersListRouterInput: PlayersListRouterInput, HasInvocations {

    enum Invocation: FakeEquatable {

    }

    var invocations: [Invocation] = []

    // MARK: PlayersListRouterInput

    func showMatchModule(with matchData: MatchData) {

    }
}
