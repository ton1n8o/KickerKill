//  Copyright © 2021 TNTStudios. All rights reserved.

import XCTest
@testable import KickerKill

final class MatchRouterTests: XCTestCase {

    var router: MatchRouter!
	var viewController: UIViewController?

    override func setUp() {
        super.setUp()

        viewController = UIViewController()

        router = MatchRouter()
        router.viewController = viewController
    }

    override func tearDown() {
        viewController = nil
        router = nil

        super.tearDown()
    }
	
}
