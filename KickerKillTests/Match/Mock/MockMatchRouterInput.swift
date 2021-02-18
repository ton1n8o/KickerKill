//  Copyright © 2021 TNTStudios. All rights reserved.

@testable import KickerKill

final class MockMatchRouterInput: MatchRouterInput, HasInvocations {

    enum Invocation: FakeEquatable {

    }

    var invocations: [Invocation] = []

    // MARK: - MatchRouterInput

}
