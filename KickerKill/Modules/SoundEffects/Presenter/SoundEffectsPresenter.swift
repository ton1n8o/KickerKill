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
        sounds = soundEffects.map({ SoundEffectData(title: $0.name, audioPath: $0.audioPath) })
        view.reloadData()
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        return sounds.count
    }
    
    func item(at indexPath: IndexPath) -> SoundEffectData {
        return sounds[indexPath.row]
    }
    
    func didSelecItem(_ item: SoundEffectData) {
        AudioPlayer.shared.play(item)
    }
    
}
