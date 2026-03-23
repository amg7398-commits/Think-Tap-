//
//  SoundButtonStyle.swift
//  ThinkTap
//
//  Created by Hussein Alzailaei on 2/13/26.
//
import SwiftUI
import AVFoundation

struct SoundButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {

        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.85 : 1)
            .onChange(of: configuration.isPressed) { pressed in
                if pressed {
                    SoundManager.shared.playSound(name: "tap")
                }
            }
    }
}
