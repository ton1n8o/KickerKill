//  Copyright © 2021 TNTStudios. All rights reserved.

@testable import KickerKill

final class MockMatchViewInput: MatchViewInput, HasInvocations {

    enum Invocation: FakeEquatable {
        case updateMatchUI(MatchViewDataModel)
    }

    var invocations: [Invocation] = []

    // MARK: MatchViewInput

    func updateMatchUI(with dataModel: MatchViewDataModel) {
        invocations.append(.updateMatchUI(dataModel))
    }
}
