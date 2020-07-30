// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

import UIKit

enum PlayerViewErrors {
    case tooManyPlayers
}

enum PlayerPosition: Int, CaseIterable {
    case firstPlayer = 1
    case secondPlayer
    case thirdPlayer
    case forthPlayer
}

final class PlayersListViewController: UIViewController, PlayersListViewInput {

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var startGameButton: UIButton!

    @IBOutlet private var player1Label: UILabel!
    @IBOutlet private var player2Label: UILabel!
    @IBOutlet private var player3Label: UILabel!
    @IBOutlet private var player4Label: UILabel!

    @IBOutlet private var playerView1: UIView!
    @IBOutlet private var playerView2: UIView!
    @IBOutlet private var playerView3: UIView!
    @IBOutlet private var playerView4: UIView!

    @IBOutlet var buttonRemovePlayer1: UIButton!
    @IBOutlet private var buttonRemovePlayer2: UIButton!
    @IBOutlet private var buttonRemovePlayer3: UIButton!
    @IBOutlet private var buttonRemovePlayer4: UIButton!

    var output: PlayersListViewOutput!
    private var players: [Player] = []

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerCell(PlayerListCell.self)
        output.viewIsReady()
        roundAndHideElements()
    }

    private func roundAndHideElements() {

        playerView3.isHidden = true
        playerView4.isHidden = true
        [playerView1, playerView2, playerView3, playerView4, startGameButton].forEach {
            $0.setRoundCorner()
        }

        [buttonRemovePlayer1, buttonRemovePlayer2, buttonRemovePlayer3, buttonRemovePlayer4].forEach {
            $0?.setRoundCorner()
            $0?.isHidden = true
            $0?.addTarget(self, action: #selector(removePlayer), for: .touchUpInside)
        }
    }

    @objc private func removePlayer(sender: UIButton) {
        guard let playerPosition = PlayerPosition(rawValue: sender.tag) else {
            assertionFailure("could not parse button tag into a PlayerPosition")
            return
        }
        output.removePlayer(at: playerPosition)
    }

    // MARK: PlayersListViewInput

    func startGame(enabled: Bool) {
        startGameButton.isEnabled = enabled
    }

    func showPlayers(_ players: [Player]) {
        self.players = players
        tableView.reloadData()
    }

    func showInitials(team1: (String?, String?), team2: (String?, String?)) {

        player1Label.text = team1.0
        showHidePlayerUI(playerView: playerView1, btnRemove: buttonRemovePlayer1, hide: team1.0 == nil)

        player3Label.text = team1.1
        showHidePlayerUI(playerView: playerView3, btnRemove: buttonRemovePlayer3, hide: team1.1 == nil)

        player2Label.text = team2.0
        showHidePlayerUI(playerView: playerView2, btnRemove: buttonRemovePlayer2, hide: team2.0 == nil)

        player4Label.text = team2.1
        showHidePlayerUI(playerView: playerView4, btnRemove: buttonRemovePlayer4, hide: team2.1 == nil)
    }

    private func showHidePlayerUI(playerView: UIView, btnRemove: UIButton, hide: Bool) {
        playerView.isHidden = hide
        btnRemove.isHidden = hide
    }

    func showError(error: PlayerViewErrors) {
        // podemos mudar a cor da tableView e desabilitala: tooManyPlayers
    }
}

// MARK: - UITableViewDataSource

extension PlayersListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: PlayerListCell.self, for: indexPath)
        cell.config(players[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PlayersListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectPlayer(players[indexPath.row])
    }
}
