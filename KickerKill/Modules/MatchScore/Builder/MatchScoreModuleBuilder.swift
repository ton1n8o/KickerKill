//  Copyright © 2021 TNTStudios. All rights reserved.

import UIKit

final class MatchScoreModuleBuilder {

    func build() -> UIViewController {

        let viewController = UIStoryboard.viewController(ofType: MatchScoreViewController.self, from: "MatchScore")

        let router = MatchScoreRouter()
        router.viewController = viewController

        let presenter = MatchScorePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MatchScoreInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }
}
