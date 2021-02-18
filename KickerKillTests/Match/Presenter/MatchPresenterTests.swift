//  Copyright © 2021 TNTStudios. All rights reserved.

import XCTest
@testable import KickerKill

final class MatchPresenterTests: XCTestCase {

    var sut: MatchPresenter!
//    var router: MatchPresenterRouterInput!
//    var interactor: MatchPresenterInteractorInput!
    var view: MockMatchViewInput!

    override func setUp() {
        super.setUp()

//        router = MatchPresenterRouterInput()
//        interactor = MatchPresenterInteractorInput()
        view = MockMatchViewInput()

        let team1 = Team()
        let team2 = Team()
        let gameType: GameType = .timeBased(minutes: 5)

        let matchData = MatchData(team1: team1,
                                  team2: team2,
                                  gameType: gameType)

        sut = MatchPresenter(matchData: matchData)
//        sut.router = router
//        sut.interactor = interactor
        sut.view = view
    }

    override func tearDown() {
//        router = nil
//        interactor = nil
        view = nil
        sut = nil

        super.tearDown()
    }

    func test_ViewIsReady_Shows_Player_Names() {

        sut.viewIsReady()
    }

}
