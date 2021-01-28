//  Copyright © 2020 TNTStudios. All rights reserved.

import UIKit

final class MatchModuleBuilder {

    private let storyboard = UIStoryboard(name: "Match", bundle: nil)
    private let matchData: MatchData

    init(matchData: MatchData) {
        self.matchData = matchData
    }

    func build() -> UIViewController {

        let viewController = storyboard.instantiateViewController(ofType: MatchViewController.self)

        let router = MatchRouter()
        router.viewController = viewController

        let presenter = MatchPresenter(matchData: matchData)
        presenter.view = viewController
        presenter.router = router

        let interactor = MatchInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }
}
