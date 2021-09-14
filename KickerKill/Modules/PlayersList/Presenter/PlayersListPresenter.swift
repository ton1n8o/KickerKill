// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

final class PlayersListPresenter: PlayersListViewOutput, PlayersListInteractorOutput {

    weak var view: PlayersListViewInput?
    var interactor: PlayersListInteractorInput!
    var router: PlayersListRouterInput!
    private var recordsPerPage = 10
    private var firstPage = false

    private var team1: Team = Team(player1: nil, player2: nil)
    private var team2: Team = Team(player1: nil, player2: nil)

    private var gameType: GameType?

    // MARK: - PlayersListViewOutput
    
    func viewIsReady() {

        interactor.fetchAllPlayers(limit: recordsPerPage, firstPage: firstPage)
        gameType = .goalBased(totalGoals: 5)
        view?.updateWithDataModel(viewDataModel)
    }

    func didSelectPlayer(_ player: Player) {
        
        guard !(team1.isFull && team2.isFull) else { return }
        guard !team1.hasPlayer(player) && !team2.hasPlayer(player) else { return }
        
        if team1.player1 == nil {
            team1.player1 = player
        } else if team2.player1 == nil {
            team2.player1 = player
        } else if team1.player2 == nil {
            team1.player2 = player
        } else {
            team2.player2 = player
        }

        view?.updateWithDataModel(viewDataModel)
    }

    private func getNextPlayer() -> PlayerPosition? {

        if team1.player1 == nil {
            return .firstPlayer
        } else if team2.player1 == nil {
            return .secondPlayer
        } else if team1.player2 == nil {
            return .thirdPlayer
        } else if team2.player2 == nil {
            return .forthPlayer
        }
        return nil // all players are selected
    }

    private var viewDataModel: PlayersListViewDataModel {

        return PlayersListViewDataModel(
            team1Initials: team1.initials,
            team2Initials: team2.initials,
            startGameEnabled: enableStartGame,
            gameType: gameType,
            nextPlayerToBeSelected: getNextPlayer()
        )
    }

    private var enableStartGame: Bool {

        let twoPlayersEach = team2.isFull && team1.isFull
        let onePlayerEach = team1.hasOnePlayer && team2.hasOnePlayer

        return (onePlayerEach || twoPlayersEach) && gameType != nil
    }

    func removePlayer(at: PlayerPosition) {

        switch at {
        case .firstPlayer:
            team1.player1 = nil
        case .secondPlayer:
            team2.player1 = nil
        case .thirdPlayer:
            team1.player2 = nil
        case .forthPlayer:
            team2.player2 = nil
        }

        view?.updateWithDataModel(viewDataModel)
    }

    func didSelectGameType(_ gameType: GameType?) {
        self.gameType = gameType
        view?.updateWithDataModel(viewDataModel)
    }

    func startGame() {

        guard let gameType = gameType else {
            fatalError("gameType is missing")
        }

        let matchData = MatchData(team1: team1,
                                  team2: team2,
                                  gameType: gameType)

        router.showMatchModule(with: matchData)
    }
    
    // MARK: - PlayersListInteractorOutput

    func didFetchPlayers(_ players: [Player]) {
        view?.showPlayers(players)
    }

    func didFailToFetchPlayers(_ error: Error) {

    }
}
