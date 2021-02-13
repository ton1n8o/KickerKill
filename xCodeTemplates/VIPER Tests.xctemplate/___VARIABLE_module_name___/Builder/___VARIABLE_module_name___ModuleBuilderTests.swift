//___FILEHEADER___

import XCTest
@testable import ___VARIABLE_testable_target___

final class ___VARIABLE_module_name___ModuleBuilderTests: XCTestCase {

    func testBuild() {

        continueAfterFailure = false

        // Arrange
        let builder = ___VARIABLE_module_name___ModuleBuilder()

        // Act
        let viewController: ___VARIABLE_module_name___ViewController! = builder.build() as? ___VARIABLE_module_name___ViewController

        // Assert
        XCTAssertNotNil(viewController)
        XCTAssertNotNil(viewController.output)

        let presenter: ___VARIABLE_module_name___Presenter! = viewController.output as? ___VARIABLE_module_name___Presenter
        XCTAssertNotNil(presenter)
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)

        let interactor: ___VARIABLE_module_name___Interactor! = presenter.interactor as? ___VARIABLE_module_name___Interactor
        XCTAssertNotNil(interactor)
        XCTAssertNotNil(interactor.output)

        let router: ___VARIABLE_module_name___Router! = presenter.router as? ___VARIABLE_module_name___Router
        XCTAssertNotNil(router)
        XCTAssertNotNil(router.viewController)
    }
}
