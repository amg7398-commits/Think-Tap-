//
//  SoundManager.swift
//  ThinkTap
//
//  Created by Hussein Alzailaei on 2/11/26.
//
import Foundation
import SwiftUI
import AVFoundation
import UIKit

class SoundManager {

    // Singleton
    static let shared = SoundManager()

    //  Audio Player
    private var player: AVAudioPlayer?
    private let correctSounds = ["correct", "correct1", "correct2"]
    private var lastCorrectSound: String? = nil
    // ============================
    //  Play Any Sound
    // ============================
    func playSound(name: String) {

        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("❌ Sound file not found: \(name).mp3")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("❌ Error playing sound: \(error.localizedDescription)")
        }
    }

    
    func playCorrectSound(){
        let available = correctSounds.filter { $0 != lastCorrectSound }
        guard let chosen = available.randomElement() else { return }
        lastCorrectSound = chosen
        playSound(name: chosen)
    }
    
    // ============================
    //  Tick Sound (Timer)
    // ============================
    func playTick() {

        guard let url = Bundle.main.url(forResource: "tick", withExtension: "mp3") else {
            print("❌ Tick sound file not found")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.4   // 🔉 soft tick
            player?.play()
        } catch {
            print("❌ Error playing tick: \(error.localizedDescription)")
        }
    }

    // ============================
    //  Vibration Feedback
    // ============================
    func vibrateCorrect() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

    func vibrateWrong() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
