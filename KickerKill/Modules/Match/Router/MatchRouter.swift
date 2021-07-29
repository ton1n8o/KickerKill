//  Copyright © 2020 TNTStudios. All rights reserved.

import UIKit

protocol MatchRouterInput {
    func dismiss(completion: (() -> Void)?)
}

final class MatchRouter: MatchRouterInput {

	weak var viewController: UIViewController?

	// MARK: - MatchRouterInput

    func dismiss(completion: (() -> Void)?) {
        viewController?.dismiss(animated: false, completion: completion)
    }

    deinit {
        print("\(String(describing: self)) >>>> GONE" )
    }
}
