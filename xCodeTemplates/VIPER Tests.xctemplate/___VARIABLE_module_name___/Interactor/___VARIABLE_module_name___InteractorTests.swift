//___FILEHEADER___

import XCTest
@testable import ___VARIABLE_testable_target___

final class ___VARIABLE_module_name___InteractorTests: XCTestCase {

    var sut: ___VARIABLE_module_name___Interactor!
    var output: Mock___VARIABLE_module_name___InteractorOutput!

    override func setUp() {
        super.setUp()

        output = Mock___VARIABLE_module_name___InteractorOutput()

        sut = ___VARIABLE_module_name___Interactor()
        sut.output = output
    }

    override func tearDown() {
        output = nil
        sut = nil

        super.tearDown()
    }

}
