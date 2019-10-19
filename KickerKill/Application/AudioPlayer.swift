// Copyright © 10/19/19 Antônio Carlos. All rights reserved.

import Foundation
import AVFoundation

final class AudioPlayer {

    static let shared = AudioPlayer()
    private var avPlayer: AVAudioPlayer?
        
    private init() {}
    
    func play( _ soundEffect: SoundEffectData) {

        guard let sound = Bundle.main.path(forResource: soundEffect.audioPath, ofType: "mp3") else {
            print("\(#function): could not load mp3 file named: \(soundEffect.audioPath)")
            return
        }

        do {
            avPlayer?.stop()
            avPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            avPlayer?.play()
        } catch {
            print(error)
        }
    }
}
