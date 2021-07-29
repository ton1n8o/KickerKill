//  Copyright © 2021 TNTStudios. All rights reserved.

protocol MatchScoreViewInput: AnyObject {

    func update(with matchScoreDataModel: MatchScoreDataModel)
}

protocol MatchScoreViewOutput {

    func viewIsReady()
    func newGame()
}
