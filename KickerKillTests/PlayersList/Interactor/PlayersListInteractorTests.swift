// Copyright © 11.06.20 Antônio Carlos. All rights reserved.

import XCTest
@testable import KickerKill

final class PlayersListInteractorTests: XCTestCase {

    var interactor: PlayersListInteractor!
    var output: MockPlayersListInteractorOutput!
    var webService: MockWebService!

    override func setUp() {
        super.setUp()

        output = MockPlayersListInteractorOutput()

        webService = MockWebService()
        interactor = PlayersListInteractor(webService: webService)
        interactor.output = output
    }

    override func tearDown() {
        output = nil
        interactor = nil

        super.tearDown()
    }

}
