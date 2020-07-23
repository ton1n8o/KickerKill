// Copyright © 11.06.20 Antônio Carlos. All rights reserved.

import XCTest
@testable import KickerKill

final class PlayersListRouterTests: XCTestCase {

    var router: PlayersListRouter!
    var viewController: UIViewController!

    override func setUp() {
        super.setUp()

        viewController = UIViewController()

        router = PlayersListRouter()
        router.viewController = viewController
    }

    override func tearDown() {
        viewController = nil
        router = nil

        super.tearDown()
    }

}
