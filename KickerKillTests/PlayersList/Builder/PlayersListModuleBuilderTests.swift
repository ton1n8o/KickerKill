// Copyright © 11.06.20 Antônio Carlos. All rights reserved.

import XCTest
@testable import KickerKill

final class PlayersListModuleBuilderTests: XCTestCase {

    func testBuild() {
        continueAfterFailure = false
        // Arrange
        let builder = PlayersListModuleBuilder()

        // Act
        let viewController: PlayersListViewController! = builder.build() as? PlayersListViewController

        // Assert
        XCTAssertNotNil(viewController)
        XCTAssertNotNil(viewController.output)

        let presenter: PlayersListPresenter! = viewController.output as? PlayersListPresenter
        XCTAssertNotNil(presenter)
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)

        let interactor: PlayersListInteractor! = presenter.interactor as? PlayersListInteractor
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(interactor.output)

        let router: PlayersListRouter! = presenter.router as? PlayersListRouter
        XCTAssertNotNil(router)
        XCTAssertNotNil(router.viewController)
    }

}
