//  Copyright © 2021 TNTStudios. All rights reserved.

import UIKit

protocol MatchScoreRouterInput {
    func newGame()
}

final class MatchScoreRouter: MatchScoreRouterInput {

	weak var viewController: UIViewController?

	// MARK: - MatchScoreRouterInput

    func newGame() {
        viewController?.dismiss(animated: true)
    }

    deinit {
        print("\(String(describing: self)) >>> GONE" )
    }	
}
