// Copyright © 2/6/20 Antônio Carlos. All rights reserved.

import UIKit

final class SignInBuilder {

    private let storyboard = UIStoryboard(name: "SignIn", bundle: nil)

    func build() -> UIViewController {

        let moduleViewController = storyboard.instantiateViewController(ofType: SignInViewController.self)

        return moduleViewController
    }
}
