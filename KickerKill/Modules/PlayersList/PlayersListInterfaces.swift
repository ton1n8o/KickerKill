// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

protocol PlayersListViewInput: class {
    func showPlayers(_ players: [Player])
    func showError(error: PlayerViewErrors)
    func showInitials(team1: (String?, String?), team2: (String?, String?)) //TODO: better naming
    func startGame(enabled: Bool)
}

protocol PlayersListViewOutput {

    func viewIsReady()
    func didSelectPlayer(_ player: Player)
    func removePlayer(at: PlayerPosition)
}
