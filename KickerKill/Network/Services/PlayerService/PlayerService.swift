// Copyright © 2/20/20 Antônio Carlos. All rights reserved.

import Foundation

protocol PlayerService {
    func createPlayer(_ playerDTO: CreatePlayerDTO, completion: @escaping (Result<Void, Error>) -> Void)
}


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
