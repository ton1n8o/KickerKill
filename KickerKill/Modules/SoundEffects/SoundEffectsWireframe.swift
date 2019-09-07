//
//  SoundEffectsWireframe.swift
//  KickerKill
//
//  Created by Antonio on 9/7/19.
//  Copyright © 2019 Antonio Carlos. All rights reserved.
//

import UIKit

final class SoundEffectsWireFrame: BaseWireframe {
    
    private let storyboard = UIStoryboard(name: "SoundEffects", bundle: nil)
    
    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: SoundEffectsViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = SoundEffectsInteractor()
        let presenter = SoundEffectsPresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }
}
extension SoundEffectsWireFrame: SoundEffectsWireFrameInterface {
    
}
