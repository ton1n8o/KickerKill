//  Copyright © 2020 TNTStudios. All rights reserved.

import UIKit

final class MatchViewController: UIViewController, MatchViewInput {

    var output: MatchViewOutput!

    @IBOutlet weak var team1Attack: UIButton!
    @IBOutlet weak var team1Defence: UIButton!
    @IBOutlet weak var team1Goals: UILabel!

    @IBOutlet weak var team2Attack: UIButton!
    @IBOutlet weak var team2Defence: UIButton!
    @IBOutlet weak var team2Goals: UILabel!

    @IBOutlet var imageViewSoccerField: UIImageView!

    @IBOutlet var timerView: UIView!
    @IBOutlet var timerLabel: UILabel!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()

        [team1Attack, team1Defence, team2Attack, team2Defence].forEach {
            setupLayoutFor(player: $0)
        }

        setupSoccerFieldImage()
    }

    private func setupLayoutFor(player button: UIButton) {

        button.setRoundCorner()
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontForContentSizeCategory = true
    }

    private func setupSoccerFieldImage() {

        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let iPhoneAspectRatio: CGFloat = 16/9

        if height/width <= iPhoneAspectRatio {
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

        timerView.isHidden = !dataModel.showTimer

        team1Attack.setTitle(dataModel.team1AttackerName, for: .normal)
        team1Defence.setTitle(dataModel.team1DefenderName, for: .normal)
        team2Attack.setTitle(dataModel.team2AttackerName, for: .normal)
        team2Defence.setTitle(dataModel.team2DefenderName, for: .normal)

        team1Goals.text = "\(dataModel.team1Goals)"
        team2Goals.text = "\(dataModel.team2Goals)"
    }

    @IBAction func team1AttackScoreGoal(_ sender: UIButton) {
        output.playerScoredGoal(teamPlayer: .team1Attack)
    }

    @IBAction func team1DefenseScoreGoal(_ sender: UIButton) {
        output.playerScoredGoal(teamPlayer: .team1Defense)
    }

    @IBAction func team2AttackScoreGoal(_ sender: UIButton) {
        output.playerScoredGoal(teamPlayer: .team2Attack)
    }

    @IBAction func team2DefenseScoreGoal(_ sender: UIButton) {
        output.playerScoredGoal(teamPlayer: .team2Defense)
    }

    deinit {
        print("\(String(describing: self)) >>> GONE" )
    }

}
