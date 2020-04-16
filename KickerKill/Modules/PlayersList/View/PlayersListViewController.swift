// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

import UIKit

final class PlayersListViewController: UIViewController, PlayersListViewInput {

    @IBOutlet var tableView: UITableView!

    var output: PlayersListViewOutput!
    private var players: [Player] = []

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerCell(PlayerListCell.self)
        output.viewIsReady()
    }

    // MARK: PlayersListViewInput

    func showPlayers(_ players: [Player]) {
        self.players = players
        tableView.reloadData()
    }
}

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

extension PlayersListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(#function): >>> \(players[indexPath.row].name)")
    }
}
