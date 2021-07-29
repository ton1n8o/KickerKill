//  Copyright © 2021 TNTStudios. All rights reserved.

@testable import KickerKill

final class MockMatchModuleOutput: MatchModuleOutput, HasInvocations {

    enum Invocation: FakeEquatable {

    }

    var invocations: [Invocation] = []

    // MARK: - MatchModuleOutput

    func gameIsOver(_ matchViewData: MatchViewDataModel) {

    }
}
