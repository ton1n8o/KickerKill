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

//        logout()

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

            let playerService = PlayerServiceImpl(webService: FirebaseWebService())

            let playerDTO = CreatePlayerDTO(player: player)
            
            playerService.createPlayer(playerDTO) { result in
                switch result {
                case .success(()):
                    print("success! 😎")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }

            // 1 - checar se usuário existe no nosso banco/firestore
            // 2 - criar/atualizar usuário
        }
        return SignInBuilder().build()
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
