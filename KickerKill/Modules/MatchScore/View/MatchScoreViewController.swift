//  Copyright © 2021 TNTStudios. All rights reserved.

import UIKit

final class MatchScoreViewController: UIViewController, MatchScoreViewInput {

    @IBOutlet weak var team1TotalScore: UILabel!
    @IBOutlet weak var team2TotalScore: UILabel!
    @IBOutlet weak var team1AttackerName: UILabel!
    @IBOutlet weak var team1DefenseName: UILabel!
    @IBOutlet weak var team2AttackerName: UILabel!
    @IBOutlet weak var team2DefenseName: UILabel!
    @IBOutlet weak var team1AttackerScore: UILabel!
    @IBOutlet weak var team1DefenseScore: UILabel!
    @IBOutlet weak var team2AttackerScore: UILabel!
    @IBOutlet weak var team2DefenseScore: UILabel!

    deinit {
        print("\(String(describing: self)) >>> GONE" )
    }

    var output: MatchScoreViewOutput!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: MatchScoreViewInput

    @IBAction func newGameTapped(_ sender: UIButton) {
        output.newGame()
    }

    func update(with matchScoreDataModel: MatchScoreDataModel) {

        team1TotalScore.text = "\(matchScoreDataModel.team1Goals)"
        team2TotalScore.text = "\(matchScoreDataModel.team2Goals)"

        team1AttackerName.text = "\(matchScoreDataModel.team1AttackerName)"
        team1DefenseName.text = "\(matchScoreDataModel.team1DefenseName)"
        team2AttackerName.text = "\(matchScoreDataModel.team2AttackerName)"
        team2DefenseName.text = "\(matchScoreDataModel.team2DefenseName)"

        team1AttackerScore.text = "\(matchScoreDataModel.team1AttackerGoals)"
        team1DefenseScore.text = "\(matchScoreDataModel.team1DefenseGoals)"
        team2AttackerScore.text = "\(matchScoreDataModel.team2AttackerGoals)"
        team2DefenseScore.text = "\(matchScoreDataModel.team2DefenseGoals)"

    }
}
