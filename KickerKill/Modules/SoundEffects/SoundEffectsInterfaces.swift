// Copyright © 9/7/19 Antônio Carlos. All rights reserved.

import UIKit

protocol SoundEffectsWireFrameInterface: WireframeInterface {
    
}

protocol SoundEffectsViewInterface: class {
    func reloadData()
}

protocol SoundEffectsPresenterInterface: PresenterInterface {
    func numberOfSections() -> Int
    func numberOrItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> SoundEffectData
}

protocol SoundEffectsInteractorInterface {    
    func fetchSoundEffects() -> [SoundEffect]
}
