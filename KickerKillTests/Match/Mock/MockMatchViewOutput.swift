//  Copyright © 2021 TNTStudios. All rights reserved.

@testable import KickerKill

final class MockMatchViewOutput: MatchViewOutput, HasInvocations {

    enum Invocation: FakeEquatable {

    }

    var invocations: [Invocation] = []

    // MARK: - MatchViewOutput

    func viewIsReady() {

    }

    func team1AttackerScoredGoal() {

    }

    func team1DefenseScoredGoal() {
        
    }
}
