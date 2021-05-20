//  Copyright © 2020 TNTStudios. All rights reserved.

protocol MatchViewInput: class {

    func updateMatchUI(with dataModel: MatchViewDataModel)
}

protocol MatchViewOutput {

    func viewIsReady()
    func playerScoredGoal(teamPlayer: TeamPlayers)
}
