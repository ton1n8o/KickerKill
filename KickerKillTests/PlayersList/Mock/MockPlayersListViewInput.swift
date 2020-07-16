// Copyright © 11.06.20 Antônio Carlos. All rights reserved.

@testable import KickerKill

final class MockPlayersListViewInput: PlayersListViewInput, HasInvocations {

    enum Invocation: FakeEquatable {
        case showInitials(team1: (String?, String?), team2: (String?, String?))
        case showError(PlayerViewErrors)
    }

    var invocations: [Invocation] = []


    func showPlayers(_ players: [Player]) {

    }

    func showInitials(team1: (String?, String?), team2: (String?, String?)) {
        invocations.append(.showInitials(team1: team1, team2: team2))
    }

    func showError(error: PlayerViewErrors) {
        invocations.append(.showError(error))
    }

}
