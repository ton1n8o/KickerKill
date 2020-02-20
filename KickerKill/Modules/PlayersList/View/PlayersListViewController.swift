// Copyright © 2/13/20 Antônio Carlos. All rights reserved.

import UIKit

final class PlayersListViewController: UIViewController, PlayersListViewInput {

    var output: PlayersListViewOutput!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }

    // MARK: PlayersListViewInput

}
