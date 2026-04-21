
//
//  try3App.swift
//  try3
//
//  Created by Hussein Alzailaei on 2/2/26.
//

import SwiftUI

@main
struct ThinkTap: App {
    

    var body: some Scene {
        WindowGroup {
            
                        StartGameView()
                .buttonStyle(SoundButtonStyle()) //  Sound for ALL buttons
            

        }
    }
}
