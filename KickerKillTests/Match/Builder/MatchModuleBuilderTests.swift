//  Copyright © 2021 TNTStudios. All rights reserved.

import XCTest
@testable import KickerKill

final class MatchModuleBuilderTests: XCTestCase {

    func testBuild() {

        continueAfterFailure = false

        // Arrange
        let builder = MatchModuleBuilder(matchData: matchData)

        // Act
        let viewController: MatchViewController! = builder.build() as? MatchViewController

        // Assert
        XCTAssertNotNil(viewController)
        XCTAssertNotNil(viewController.output)

        let presenter: MatchPresenter! = viewController.output as? MatchPresenter
        XCTAssertNotNil(presenter)
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)

        let interactor: MatchInteractor! = presenter.interactor as? MatchInteractor
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(interactor.output)

        let router: MatchRouter! = presenter.router as? MatchRouter
        XCTAssertNotNil(router)
        XCTAssertNotNil(router.viewController)
    }

    private var matchData: MatchData {

        let team1 = Team()
        let team2 = Team()
        return MatchData(team1: team1, team2: team2, gameType: .goalBased(totalGoals: 5))
    }
}
