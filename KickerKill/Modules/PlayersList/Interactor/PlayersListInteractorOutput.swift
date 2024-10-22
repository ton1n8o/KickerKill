// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

protocol PlayersListInteractorOutput: class {
    func didFetchPlayers(_ players: [Player])
    func didFailToFetchPlayers(_ error: Error)
}
