// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

import UIKit

protocol PlayersListRouterInput {
    func showMatchModule(with matchData: MatchData)
}

final class PlayersListRouter: PlayersListRouterInput {

    weak var viewController: UIViewController?

    // MARK: - PlayersListRouterInput

    func showMatchModule(with matchData: MatchData) {

        let matchVC = MatchModuleBuilder(matchData: matchData).build()
        matchVC.modalPresentationStyle = .fullScreen
        viewController?.present(matchVC, animated: true)
    }
}
