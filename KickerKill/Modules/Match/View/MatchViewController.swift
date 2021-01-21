//
//  MatchViewController.swift
//  KickerKill
//
//  Created by Antonio on 11/12/20.
//  Copyright © 2020 TNTStudios. All rights reserved.
//

import UIKit

final class MatchViewController: UIViewController, MatchViewInput {

    var output: MatchViewOutput!

    @IBOutlet weak var team1Attack: UIButton!
    @IBOutlet weak var team1Defence: UIButton!
    @IBOutlet weak var team2Attack: UIButton!
    @IBOutlet weak var team2Defence: UIButton!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()

//        team1Attack.setRoundCorner()
//        team1Defence.setRoundCorner()
//        team2Attack.setRoundCorner()
//        team2Defence.setRoundCorner()
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        .landscapeLeft
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .landscape
    }

    // MARK: MatchViewInput

}
