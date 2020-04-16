// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

protocol PlayersListViewInput: class {
    func showPlayers(_ players: [Player])
}

protocol PlayersListViewOutput {

    func viewIsReady()
}
