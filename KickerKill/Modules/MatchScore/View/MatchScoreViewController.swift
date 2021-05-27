//  Copyright © 2021 TNTStudios. All rights reserved.

import UIKit

final class MatchScoreViewController: UIViewController, MatchScoreViewInput {

    var output: MatchScoreViewOutput!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }

    // MARK: MatchScoreViewInput

}
