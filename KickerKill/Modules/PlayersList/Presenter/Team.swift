// Copyright © 25.06.20 Antônio Carlos. All rights reserved.

import Foundation

struct Team {
    var player1: Player?
    var player2: Player?

    var initials: (p1: String?, p2: String?) {
        return (player1?.name.first?.uppercased(),
                player2?.name.first?.uppercased())
    }
}
