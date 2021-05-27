//  Copyright © 2020 TNTStudios. All rights reserved.

import UIKit

protocol MatchModuleOutput: class {
    func gameIsOver(_ matchViewData: MatchViewDataModel)
}

final class MatchModuleBuilder {

    private let storyboard = UIStoryboard(name: "Match", bundle: nil)
    private let matchData: MatchData
    private let moduleOutput: MatchModuleOutput

    internal init(matchData: MatchData, output: MatchModuleOutput) {
        self.matchData = matchData
        self.moduleOutput = output
    }

    func build() -> UIViewController {

        let viewController = storyboard.instantiateViewController(ofType: MatchViewController.self)

        let router = MatchRouter()
        router.viewController = viewController

        let presenter = MatchPresenter(matchData: matchData)
        presenter.view = viewController
        presenter.router = router
        presenter.moduleOutput = moduleOutput

        let interactor = MatchInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }

    deinit {
        print("\(String(describing: self)) >>> GONE" )
    }
}
