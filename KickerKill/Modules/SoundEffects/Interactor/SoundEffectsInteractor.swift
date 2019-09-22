// Copyright © 9/7/19 Antônio Carlos. All rights reserved.

import Foundation

final class SoundEffectsInteractor {
    
}
extension SoundEffectsInteractor: SoundEffectsInteractorInterface {
    
    func fetchSoundEffects() -> [SoundEffect] {
        return [
            SoundEffect(name: "First blood", audioPath: ""),
            SoundEffect(name: "Head shot", audioPath: ""),
            SoundEffect(name: "Monster kill", audioPath: "")
        ]
    }
}
