//
//  MatchPresenter.swift
//  KickerKill
//
//  Created by Antonio on 11/12/20.
//  Copyright © 2020 TNTStudios. All rights reserved.
//

final class MatchPresenter: MatchViewOutput, MatchInteractorOutput {

    weak var view: MatchViewInput?
    var interactor: MatchInteractorInput!
    var router: MatchRouterInput!

    // MARK: - MatchViewOutput

    func viewIsReady() {

    }

    // MARK: - MatchInteractorOutput

}
