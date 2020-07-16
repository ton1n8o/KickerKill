// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

import UIKit

final class PlayersListModuleBuilder {

    private let storyboard = UIStoryboard(name: "PlayersList", bundle: nil)
    
    func build() -> UIViewController {
        
        let viewController = storyboard.instantiateViewController(ofType: PlayersListViewController.self)
        
        let router = PlayersListRouter()
        router.viewController = viewController
        
        let presenter = PlayersListPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = PlayersListInteractor(webService: FirebaseWebService())
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }
    
}
