//  Copyright © 2021 TNTStudios. All rights reserved.

import UIKit

final class MatchScoreModuleBuilder {

    func build(_ matchViewData: MatchViewDataModel) -> UIViewController {

        let viewController = UIStoryboard.viewController(ofType: MatchScoreViewController.self, from: "MatchScore")

        let router = MatchScoreRouter()
        router.viewController = viewController

        let presenter = MatchScorePresenter(matchViewData)
        presenter.view = viewController
        presenter.router = router

        let interactor = MatchScoreInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }

    deinit {
        print("\(String(describing: self)) >>> GONE" )
    }
}
