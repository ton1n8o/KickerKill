//
//  SoundEffectsViewController.swift
//  KickerKill
//
//  Created by Antonio on 9/7/19.
//  Copyright © 2019 Antonio Carlos. All rights reserved.
//

import UIKit

final class SoundEffectsViewController: UIViewController {

    var presenter: SoundEffectsPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension SoundEffectsViewController: SoundEffectsViewInterface {
    
}
