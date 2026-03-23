//
//  TapSoundModifier.swift
//  ThinkTap
//
//  Created by Hussein Alzailaei on 2/13/26.
//



import SwiftUI

extension View {

    func tapSound() -> some View {
        self.simultaneousGesture(
            TapGesture().onEnded {
                SoundManager.shared.playSound(name: "tap")
            }
        )
    }
}
