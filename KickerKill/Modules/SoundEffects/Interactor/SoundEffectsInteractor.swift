// Copyright © 9/7/19 Antônio Carlos. All rights reserved.

import Foundation

final class SoundEffectsInteractor {
    
}
extension SoundEffectsInteractor: SoundEffectsInteractorInterface {
    
    func fetchSoundEffects() -> [SoundEffect] {
        return [
            SoundEffect(name: "D", audioPath: "denied"),
            SoundEffect(name: "H", audioPath: "holy_shit"),
            SoundEffect(name: "PF", audioPath: "prepare_to_fight"),
            SoundEffect(name: "I", audioPath: "impressive")
        ]
    }
}
