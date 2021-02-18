//  Copyright © 2021 TNTStudios. All rights reserved.

import XCTest
@testable import KickerKill

final class MatchViewControllerTests: XCTestCase {

    var output: MockMatchViewOutput!
    var sut: MatchViewController!

    override func setUp() {
        super.setUp()

        output = MockMatchViewOutput()
        sut = MatchViewController()

        sut.output = output
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        output = nil

        super.tearDown()
    }

}
