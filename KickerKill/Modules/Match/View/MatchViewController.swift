//  Copyright © 2020 TNTStudios. All rights reserved.

import UIKit

final class MatchViewController: UIViewController, MatchViewInput {

    var output: MatchViewOutput!

    @IBOutlet weak var team1Attack: UIButton!
    @IBOutlet weak var team1Defence: UIButton!
    @IBOutlet weak var team2Attack: UIButton!
    @IBOutlet weak var team2Defence: UIButton!

    @IBOutlet var imageViewSoccerField: UIImageView!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()

        team1Attack.setRoundCorner()
        team1Defence.setRoundCorner()
        team2Attack.setRoundCorner()
        team2Defence.setRoundCorner()

        setupSoccerFieldImage()
    }

    private func setupSoccerFieldImage() {

        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let iphoneAspectRatio: CGFloat = 16/9

        if height/width <= iphoneAspectRatio {
            imageViewSoccerField.image = UIImage(named: "soccerField_iPhone")
        } else {
            imageViewSoccerField.image = UIImage(named: "soccerField_iPhoneX")
        }
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        .landscapeLeft
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .landscape
    }

    // MARK: MatchViewInput

    func updateMatchUI(with dataModel: MatchViewDataModel) {
        //TODO: enviar objeto com dados aqui.
    }

}
