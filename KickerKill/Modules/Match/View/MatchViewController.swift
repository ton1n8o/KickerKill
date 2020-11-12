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

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewIsReady()
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        .landscapeLeft
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .landscape
    }

    // MARK: MatchViewInput

}
