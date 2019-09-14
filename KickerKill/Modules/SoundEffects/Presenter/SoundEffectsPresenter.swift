// Copyright © 9/7/19 Antônio Carlos. All rights reserved.

import Foundation

final class SoundEffectsPresenter {
    
    private unowned var view: SoundEffectsViewInterface
    private var interactor: SoundEffectsInteractorInterface
    private var wireframe: SoundEffectsWireFrameInterface
    private var sounds: [SoundEffectData] = []
    
    init(wireframe: SoundEffectsWireFrameInterface, view: SoundEffectsViewInterface, interactor: SoundEffectsInteractorInterface) {
        self.wireframe = wireframe
        self.view = view
        self.interactor = interactor
    }
}
extension SoundEffectsPresenter: SoundEffectsPresenterInterface {
    
    func viewDidLoad() {
        let soundEffects = interactor.fetchSoundEffects()
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOrItems(in section: Int) -> Int {
        return sounds.count
    }
    
    func item(at indexPath: IndexPath) -> SoundEffectData {
        return sounds[indexPath.row]
    }
    
}
