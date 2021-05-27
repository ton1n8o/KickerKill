//  Copyright © 2021 TNTStudios. All rights reserved.

final class MatchScoreInteractor: MatchScoreInteractorInput {

    weak var output: MatchScoreInteractorOutput?

    // MARK: - MatchScoreInteractorInput

    deinit {
        print("\(String(describing: self)) >>> GONE" )
    }

}
