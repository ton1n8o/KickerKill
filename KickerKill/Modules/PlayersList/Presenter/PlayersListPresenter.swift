// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

final class PlayersListPresenter: PlayersListViewOutput, PlayersListInteractorOutput {

    weak var view: PlayersListViewInput?
    var interactor: PlayersListInteractorInput!
    var router: PlayersListRouterInput!

    // MARK: - PlayersListViewOutput
    
    func viewIsReady() {

    }
    
    // MARK: - PlayersListInteractorOutput
    
}
