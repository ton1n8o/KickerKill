// Copyright © 25.06.20 Antônio Carlos. All rights reserved.

import Foundation

struct Team {

    var player1: Player?
    var player2: Player?

    var initials: (p1: String?, p2: String?) {
        return (player1?.name.first?.uppercased(),
                player2?.name.first?.uppercased())
    }

    var isFull: Bool {
        return player1 != nil && player2 != nil
    }

    var hasOnePlayer: Bool {
        return [player1, player2].compactMap { $0 }.count == 1
    }

    func hasPlayer(_ player: Player) -> Bool {
        return player1 == player || player2 == player
    }
}
