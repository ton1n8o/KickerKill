//___FILEHEADER___

import XCTest
@testable import ___VARIABLE_testable_target___

final class ___VARIABLE_module_name___ViewControllerTests: XCTestCase {

    var output: Mock___VARIABLE_module_name___ViewOutput!
    var sut: ___VARIABLE_module_name___ViewController!

    override func setUp() {
        super.setUp()

        output = Mock___VARIABLE_module_name___ViewOutput()
        sut = ___VARIABLE_module_name___ViewController()

        sut.output = output
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        output = nil

        super.tearDown()
    }

}
