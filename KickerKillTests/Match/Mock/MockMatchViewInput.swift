//  Copyright © 2021 TNTStudios. All rights reserved.

@testable import KickerKill

final class MockMatchViewInput: MatchViewInput, HasInvocations {

    enum Invocation: FakeEquatable {
        case updateMatchUI(MatchViewDataModel)
    }

    var invocations: [Invocation] = []

    func updateMatchUI(with matchData: MatchViewDataModel) {
        invocations.append(.updateMatchUI(matchData))
    }
}
