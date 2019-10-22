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
            SoundEffect(name: "I", audioPath: "impressive"),
            SoundEffect(name: "OF", audioPath: "one_frag_left"),
            SoundEffect(name: "HU", audioPath: "humiliation"),
            SoundEffect(name: "DO", audioPath: "dominating"),
            SoundEffect(name: "DK", audioPath: "double kill"),
            SoundEffect(name: "GL", audioPath: "god_like"),
            SoundEffect(name: "HS", audioPath: "head_shot"),
            SoundEffect(name: "KS", audioPath: "killing_spreed"),
            SoundEffect(name: "MK", audioPath: "monster_kill"),
            SoundEffect(name: "U", audioPath: "unstopable"),
            SoundEffect(name: "Y", audioPath: "you_have_lost_the_match")
        ]
    }
}
