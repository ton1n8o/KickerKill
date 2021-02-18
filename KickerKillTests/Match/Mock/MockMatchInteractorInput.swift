//  Copyright © 2021 TNTStudios. All rights reserved.

@testable import KickerKill

final class MockMatchInteractorInput: MatchInteractorInput, HasInvocations {

    enum Invocation: FakeEquatable {

    }

    var invocations: [Invocation] = []

    // MARK: - MatchInteractorInput

}
