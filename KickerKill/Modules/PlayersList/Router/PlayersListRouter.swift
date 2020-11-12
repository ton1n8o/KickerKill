// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

import UIKit

protocol PlayersListRouterInput {
    func showMatchModule()
}

final class PlayersListRouter: PlayersListRouterInput {

    weak var viewController: UIViewController?

    // MARK: - PlayersListRouterInput

    func showMatchModule() {

        let matchVC = MatchModuleBuilder().build()
        matchVC.modalPresentationStyle = .fullScreen
        viewController?.present(matchVC, animated: true)
    }

}
