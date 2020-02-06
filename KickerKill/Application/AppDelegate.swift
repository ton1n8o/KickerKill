// Copyright © 9/7/19 Antônio Carlos. All rights reserved.

import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        FirebaseApp.configure()

        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            self?.window?.rootViewController = self?.startupUI(firebaseUser: user)
            self?.window?.makeKeyAndVisible()
        }

        return true
    }
}

private extension AppDelegate {

    private func startupUI(firebaseUser: FirebaseAuth.User?) -> UIViewController {

        if let user = firebaseUser {
            let player = Player(user)
//            navigationController.setRootWireframe(PrayerListWireframe(user: pray4meUser))
        }
        return SignInBuilder().build()
    }
}
