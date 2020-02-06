// Copyright © 2/6/20 Antônio Carlos. All rights reserved.

import Foundation
import FirebaseAuth

struct Player {

    let id: String
    let name: String
    let email: String
}

extension Player {

    init(_ firebaseUser: FirebaseAuth.User) {
        self.id = firebaseUser.uid
        self.email = firebaseUser.email ?? ""
        self.name = firebaseUser.displayName ?? ""
    }
}
