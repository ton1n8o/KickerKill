// Copyright © 2/6/20 Antônio Carlos. All rights reserved.

import UIKit
import FirebaseUI
import Firebase

final class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapLogin(_ sender: UIButton) {

        guard let authUI = FUIAuth.defaultAuthUI() else {
            assertionFailure("FUIAuth.defaultAuthUI() did not return a FUIAuth instance.")
            return
        }

        authUI.delegate = self
        authUI.providers = providers
        let authViewController = authUI.authViewController()

        present(authViewController, animated: true)
    }

    private var providers: [FUIAuthProvider] {
        return [FUIGoogleAuth(), FUIEmailAuth()]
    }
}

extension SignInViewController: FUIAuthDelegate {

    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {

        guard let error = error else { return }

        let userTappedCancel = (error as NSError).code == 1
        if !userTappedCancel {
            let message = NSLocalizedString("Authentication failed:", comment: "")
            showError("\(message) \(error.localizedDescription)")
        }
    }

    private func showError(_ error: String) {
        let msgActionTitle = CommonMessages.ok.localized
        let alertAction = UIAlertAction(title: msgActionTitle, style: .default)
        showInfo(withMessage: error, alertAction: alertAction)
    }
}
