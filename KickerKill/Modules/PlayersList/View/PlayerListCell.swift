// Copyright © 4/16/20 Antônio Carlos. All rights reserved.

import UIKit

final class PlayerListCell: UITableViewCell, Identifiable {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    @IBOutlet private var idLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(_ player: Player) {
        nameLabel.text = player.name
        emailLabel.text = player.email
        idLabel.text = player.id
    }
}
