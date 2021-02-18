//___FILEHEADER___

import XCTest
@testable import ___VARIABLE_testable_target___

final class ___VARIABLE_module_name___RouterTests: XCTestCase {

    var router: ___VARIABLE_module_name___Router!
	var viewController: UIViewController?

    override func setUp() {
        super.setUp()

        viewController = UIViewController()

        router = ___VARIABLE_module_name___Router()
        router.viewController = viewController
    }

    override func tearDown() {
        viewController = nil
        router = nil

        super.tearDown()
    }
	
}
