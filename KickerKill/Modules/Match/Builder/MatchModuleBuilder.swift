//  Copyright © 2020 TNTStudios. All rights reserved.

import UIKit

final class MatchModuleBuilder {

    private let storyboard = UIStoryboard(name: "Match", bundle: nil)

    func build() -> UIViewController {

        let viewController = storyboard.instantiateViewController(ofType: MatchViewController.self)

        let router = MatchRouter()
        router.viewController = viewController

        let presenter = MatchPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MatchInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }
}
