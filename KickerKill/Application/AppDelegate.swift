// Copyright © 9/7/19 Antônio Carlos. All rights reserved.

import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var playerService: PlayerServiceImpl!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        FirebaseApp.configure()
        playerService = PlayerServiceImpl(webService: FirebaseWebService())

//        logout()

        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            self?.startupUI(firebaseUser: user)
        }

        return true
    }
}

private extension AppDelegate {

    private func startupUI(firebaseUser: FirebaseAuth.User?) {

        window?.rootViewController = SignInBuilder().build()
        window?.makeKeyAndVisible()

        guard let user = firebaseUser else {
            print("\(#function): >>> no Firebase user")
            return
        }

        // intermediate state??

        let player = Player(user)
        let playerDTO = CreatePlayerDTO(player: player)

        playerService.createOrUpdate(playerDTO) { error in
            if let error = error {
                // window?.rootViewController . // toma aqui o erro
                print("\(#function): >>> \(error.localizedDescription)")
            } else {
                let viewController = PlayersListModuleBuilder().build()
                self.window?.rootViewController = UINavigationController(rootViewController: viewController)
            }
        }
    }

    private func logout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
