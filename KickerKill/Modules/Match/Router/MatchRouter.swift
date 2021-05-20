//  Copyright © 2020 TNTStudios. All rights reserved.

import UIKit

protocol MatchRouterInput {
    func showScoreBoard( _ matchViewData: MatchViewDataModel)
}

final class MatchRouter: MatchRouterInput {

	weak var viewController: UIViewController?

	// MARK: - MatchRouterInput

    func showScoreBoard(_ matchViewData: MatchViewDataModel) {

    }

    deinit {
        print("\(#file.components(separatedBy: "/").last!) >>> GONE.")
    }
}
