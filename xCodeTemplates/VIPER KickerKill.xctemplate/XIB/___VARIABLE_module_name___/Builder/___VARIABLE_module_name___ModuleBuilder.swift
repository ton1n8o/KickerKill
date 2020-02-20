//___FILEHEADER___

import UIKit

final class ___VARIABLE_module_name___ModuleBuilder {
    
    func build() -> UIViewController {
        
        let viewController = ___VARIABLE_module_name___ViewController()
        
        let router = ___VARIABLE_module_name___Router()
        router.viewController = viewController
        
        let presenter = ___VARIABLE_module_name___Presenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = ___VARIABLE_module_name___Interactor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
        
        return viewController
    }
    
}
