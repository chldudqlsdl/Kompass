//
//  SoundManager.swift
//  Orum
//
//  Created by Youngbin Choi on 10/24/23.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    
    func playSound(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: ".m4a") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}
