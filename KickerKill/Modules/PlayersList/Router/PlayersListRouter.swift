// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

import UIKit

protocol PlayersListRouterInput {
    func showMatchModule(with matchData: MatchData)
}

final class PlayersListRouter: PlayersListRouterInput {

    weak var viewController: UIViewController?

    // MARK: - PlayersListRouterInput

    func showMatchModule(with matchData: MatchData) {

        let matchVC = MatchModuleBuilder(matchData: matchData, output: self).build()
        matchVC.modalPresentationStyle = .fullScreen
        viewController?.present(matchVC, animated: true)
    }
}

extension PlayersListRouter: MatchModuleOutput {

    func gameIsOver(_ matchViewData: MatchViewDataModel) {

        let matchScoreVC = MatchScoreModuleBuilder().build(matchViewData)
        matchScoreVC.modalPresentationStyle = .fullScreen
        viewController?.present(matchScoreVC, animated: true)
    }
}
