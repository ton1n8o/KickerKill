// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

protocol PlayersListViewInput: class {
    func showPlayers(_ players: [Player])
    func showError(error: PlayerViewErrors)
    func updateWithDataModel(_ dataModel: PlayersListViewDataModel)
    func updateGameType(_ gameType: GameType)
}

protocol PlayersListViewOutput {

    func viewIsReady()
    func didSelectPlayer(_ player: Player)
    func removePlayer(at: PlayerPosition)
    func didSelectGameType(_ gameType: GameType?)
    func startGame()
    func getNextPlayer() -> PlayerPosition
}
