//
//  SoundEffectsPresenter.swift
//  KickerKill
//
//  Created by Antonio on 9/7/19.
//  Copyright © 2019 Antonio Carlos. All rights reserved.
//

import Foundation

final class SoundEffectsPresenter {
    
    private unowned var view: SoundEffectsViewInterface
    private var interactor: SoundEffectsInteractorInterface
    private var wireframe: SoundEffectsWireFrameInterface
    
    init(wireframe: SoundEffectsWireFrameInterface, view: SoundEffectsViewInterface, interactor: SoundEffectsInteractorInterface) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
}
extension SoundEffectsPresenter: SoundEffectsPresenterInterface {
    
}
