//
//  Win&LoseView.swift
//  ThinkTap
//
//  Created by Hussein Alzailaei on 3/25/26.
//

import SwiftUI

//  WINNING SCREEN




struct WinningView: View {
    @Binding var startBoard: Bool
    var winnerName: String?
    var finalTickets: Int

    var categoryName: String
    var categoryImage: String

    @Environment(\.dismiss) var dismiss
    @Environment(\.verticalSizeClass) private var vSize
    // Device Helpers
    private var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    

    private var isLandscape: Bool {
        vSize == .compact  // compact height = landscape on iPhone
    }

    // Smooth adaptive scale
    private var scale: CGFloat {
        isIPad ? (isLandscape ? 1.1 : 1.0) : 0.85
    }

    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack {
                Spacer(minLength: 10)

                content

                Spacer(minLength: 10)
            }
            
            .frame(maxWidth: isIPad ? 600 : .infinity)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, isIPad ? 20 : 12)
        }
        .onAppear {
            SoundManager.shared.playSound(name: "wingame")
        }
    }

    // MARK: - Main Content
    private var content: some View {
        VStack(spacing: 25 * scale) {

            // Title
            VStack(spacing: 10 * scale) {
                Text("Congratulations!")
                    .font(.system(size: 42 * scale, weight: .heavy))
                    .foregroundColor(.blue)

                Text("You won the board!")
                    .font(.system(size: 26 * scale, weight: .bold))
                    .foregroundColor(.primary)
            }

            // Winner (Multiplayer only)
            if let winner = winnerName {
                VStack(spacing: 8 * scale) {
                    Text("🏆 Winner 🏆")
                        .font(.system(size: 24 * scale, weight: .heavy))
                        .foregroundColor(.primary)

                    Text(winner)
                        .font(.system(size: 30 * scale, weight: .heavy, design: .rounded))
                        .foregroundColor(.blue)
                        .shadow(color: .blue.opacity(0.3), radius: 6, y: 3)
                }
                .padding(12 * scale)
                .frame(maxWidth: .infinity)
                .background(Color.orange.opacity(0.20))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange.opacity(0.5), lineWidth: 2)
                )
            }

            // Category Card
            VStack(spacing: 10 * scale) {
                Image(categoryImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140 * scale, height: 140 * scale)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .black.opacity(0.3), radius: 10, y: 5)

                Text(categoryName)
                    .font(.system(size: 22 * scale, weight: .bold))
                    .foregroundColor(.primary)
            }
            .padding(12 * scale)
            .background(Color.blue.opacity(0.25))
            .cornerRadius(20)
            .shadow(radius: 10)

            // Tickets
            HStack(spacing: 10) {
                Image(systemName: "ticket.fill")
                    .font(.system(size: 26 * scale, weight: .bold))
                    .foregroundColor(.blue)

                Text("Final Tickets: \(finalTickets)")
                    .font(.system(size: 28 * scale, weight: .bold))
                    .foregroundColor(.primary)
            }
            .padding(.top, 5)

            // Button
            Button {
                dismiss()
                startBoard = false
            } label: {
                Text("Back to Topic Categories")
                    .font(.system(size: 18 * scale, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(12 * scale)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.2), radius: 8, y: 4)
            }
        }
    }
}


// *******   LosingScreen  *******

struct LosingView: View {
    @Binding var startBoard: Bool

    var categoryName: String
    var categoryImage: String

    @Environment(\.dismiss) var dismiss
    @Environment(\.verticalSizeClass) private var vSize
    // Device Helpers
    private var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }

    

    private var isLandscape: Bool {
        vSize == .compact  // compact height = landscape on iPhone
    }

    // Smooth adaptive scale
    private var scale: CGFloat {
        isIPad ? (isLandscape ? 1.1 : 1.0) : 0.85
    }

    var body: some View {
        ZStack {
            // Background
            Color.blue.opacity(0.20)
                .ignoresSafeArea()

            VStack {
                Spacer(minLength: 10)

                content

                Spacer(minLength: 10)
            }
            
            .frame(maxWidth: isIPad ? 600 : .infinity)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, isIPad ? 20 : 12)
        }
        .onAppear {
            SoundManager.shared.playSound(name: "lostgame")
        }
    }

    //  Main Content
    private var content: some View {
        VStack(spacing: 25 * scale) {

            // Title
            VStack(spacing: 10 * scale) {
                Text("Oh No!")
                    .font(.system(size: 42 * scale, weight: .heavy))
                    .foregroundColor(.red)
                    .shadow(radius: 2)

                Text("You lost the board!")
                    .font(.system(size: 28 * scale, weight: .bold))
                    .foregroundColor(.blue)
            }

            // Category Card
            VStack(spacing: 10 * scale) {
                Image(categoryImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140 * scale, height: 140 * scale)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .black.opacity(0.3), radius: 10, y: 5)

                Text(categoryName)
                    .font(.system(size: 22 * scale, weight: .bold))
                    .foregroundColor(.primary)
            }
            .padding(12 * scale)
            .background(Color.accentColor.opacity(0.30))
            .cornerRadius(20)
            .shadow(radius: 10)

            // Tickets
            HStack(spacing: 10) {
                Image(systemName: "ticket.fill")
                    .font(.system(size: 26 * scale, weight: .bold))
                    .foregroundColor(.blue)

                Text("Final Tickets: 0")
                    .font(.system(size: 28 * scale, weight: .bold))
                    .foregroundColor(.primary)
            }
            .padding(.top, 5)

            // Button
            Button {
                dismiss()
                startBoard = false
            } label: {
                Text("Back to Topic Categories")
                    .font(.system(size: 18 * scale, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(12 * scale)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.2), radius: 8, y: 4)
            }
        }
    }
}

