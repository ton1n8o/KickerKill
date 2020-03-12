// Copyright © 3/5/20 Antônio Carlos. All rights reserved.

import Foundation

struct CreatePlayerDTO: Encodable {

    let name: String
    let email: String
    let firestoreUID: String

    init(player: Player) {
        self.name = player.name
        self.email = player.email
        self.firestoreUID = player.id
    }
}
