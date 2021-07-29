//
//  MatchInteractor.swift
//  KickerKill
//
//  Created by Antonio on 11/12/20.
//  Copyright © 2020 TNTStudios. All rights reserved.
//

final class MatchInteractor: MatchInteractorInput {

    weak var output: MatchInteractorOutput?

    // MARK: - MatchInteractorInput

    deinit {
        print("\(String(describing: self)) >>> GONE" )
    }
}
