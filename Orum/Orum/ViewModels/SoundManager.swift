//
//  SoundManager.swift
//  Orum
//
//  Created by Youngbin Choi on 10/24/23.
//

import SwiftUI
import AVKit

class SoundManager: NSObject, AVAudioPlayerDelegate {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    var completion: (() -> Void)?

    func playSound(sound: String, completion: (() -> Void)?) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: ".m4a") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.play()
            self.completion = completion
        } catch {
            print(error.localizedDescription)
        }
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        // 사운드 재생이 끝났을 때 호출되는 메서드
        completion?()
        completion = nil
    }
}
