//
//  AudioRecorderManager.swift
//  Orum
//
//  Created by Youngbin Choi on 11/17/23.
//

import Foundation
import AVFoundation

class AudioRecorderManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    var audioRecorder: AVAudioRecorder?
    @Published var isRecording = false
    
    var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    @Published var isPaused = false
    
    var recordedFiles = [URL]()
}

extension AudioRecorderManager {
    func startRecording() {
        recordedFiles = []
        let fileURL = getDocumentsDirectory().appendingPathComponent("\(Date().timeIntervalSince1970).m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleBufferAudioRendererFlushTimeKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: fileURL, settings: settings)
            audioRecorder?.record()
            self.isRecording = true
        } catch {
            print("녹음 중 오류 발생: \(error.localizedDescription)")
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        self.recordedFiles.append(self.audioRecorder!.url)
        self.isRecording = false
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

extension AudioRecorderManager {
    func startPlaying(recordingURL: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: recordingURL)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            self.isPlaying = true
            self.isPaused = false
            print("성공")
        } catch {
            print("재생 중 오류 발생: \(error.localizedDescription)")
        }
    }
    
    func stopPlaying() {
        audioPlayer?.stop()
        self.isPlaying = false
    }
    
    func pausePlaying() {
        audioPlayer?.pause()
        self.isPaused = true
    }
    func resumePlaying() {
        audioPlayer?.play()
        self.isPaused = false
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.isPlaying = false
        self.isPaused = false
    }
}

