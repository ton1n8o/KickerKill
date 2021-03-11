//___FILEHEADER___

import XCTest
@testable import ___VARIABLE_testable_target___

final class ___VARIABLE_module_name___PresenterTests: XCTestCase {

    var sut: ___VARIABLE_module_name___Presenter!
    var router: Mock___VARIABLE_module_name___RouterInput!
    var interactor: Mock___VARIABLE_module_name___InteractorInput!
    var view: Mock___VARIABLE_module_name___ViewInput!

    override func setUp() {
        super.setUp()

        router = Mock___VARIABLE_module_name___RouterInput()
        interactor = Mock___VARIABLE_module_name___InteractorInput()
        view = Mock___VARIABLE_module_name___ViewInput()

        sut = ___VARIABLE_module_name___Presenter()
        sut.router = router
        sut.interactor = interactor
        sut.view = view
    }

    override func tearDown() {
        router = nil
        interactor = nil
        view = nil
        sut = nil

        super.tearDown()
    }

}
