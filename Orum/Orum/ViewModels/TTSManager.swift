//
//  TTSManager.swift
//  Orum
//
//  Created by Youngbin Choi on 10/21/23.
//

import Foundation
import AVFoundation

class TTSManager {
    
    static let shared = TTSManager()
    
    private let synthesizer = AVSpeechSynthesizer()
    
    internal func play(_ string: String) {
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = 0.1
        utterance.pitchMultiplier = 0.5
        synthesizer.stopSpeaking(at: .immediate)
        synthesizer.speak(utterance)
    }
    
    internal func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}
