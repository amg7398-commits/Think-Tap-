//
//  ameInstructionsView.swift
//  ThinkTap
//
//  Created by Hussein Alzailaei on 3/25/26.
//

import SwiftUI
struct GameInstructionsView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {

                //  Title
                Text("Game Instructions")
                    .font(.largeTitle.bold())
                    .padding(.top, 20)
                    
                

                //  One Player Section
                InstructionCard(
                    title: "One-Player Mode",
                    icon: "person.fill",
                    color: .blue,
                    text: """
When playing One-Player mode, you’ll compete against the trivia board.

• You start with 20 tickets.
• Every incorrect answers always deducts 2 tickets.
• Correct answers do not award tickets.
• Reach 0 tickets and you lose.
• Clear the board with tickets leftover and you win!

Answer carefully to secure victory!
"""
                )
                .foregroundStyle(.primary)
                .bold()
                // Two Player Section
                InstructionCard(
                    title: "Two-Player Mode",
                    icon: "person.2.fill",
                    color: .blue,
                    text: """
When playing Two-Player mode, you'll compete against another player.

• Each player starts with 10 tickets.
• Every incorrect answer always deduct 1 ticket.
• Correct answers do not award tickets.
• First player to reach 0 tickets loses.
• Players take turns answering questions.

If the board is cleared and player scores are tied, Sudden Trivia begins!
"""
                )
                .foregroundStyle(.primary)
                .bold()
                //  Sudden Trivia Section
                InstructionCard(
                    title: "Sudden Trivia Round",
                    icon: "bolt.fill",
                    color: .orange,
                    text: """
Sudden Trivia is a best-of-three showdown!

• Two players compete quickly.
• First player to correctly answer 2 out of 3 questions wins!

Fast, intense, and fun!
"""
                )
                .foregroundStyle(.primary)
                    .bold()
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .navigationTitle("Help")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// @@@@@@@@@@@@@@@@@@@@@
// CONFETTI SYSTEM
// @@@@@@@@@@@@@@@@@@@@@

struct ConfettiParticle: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var size: CGFloat
    var rotation: Double
    var color: Color
}

struct ConfettiView: View {

    var isCorrect: Bool
    @State private var particles: [ConfettiParticle] = []

    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(particles) { particle in
                    Rectangle()
                        .fill(particle.color)
                        .frame(width: particle.size, height: particle.size * 1.8)
                        .rotationEffect(.degrees(particle.rotation))
                        .position(x: particle.x, y: particle.y)
                }
            }
            .ignoresSafeArea()
            .onAppear {
                launchConfetti(width: geo.size.width)
            }
        }
    }

    func launchConfetti(width: CGFloat) {

        particles.removeAll()

        let colors: [Color] = isCorrect
            ? [.green, .yellow, .orange, .blue, .purple]
            : [.gray, .red.opacity(0.8), .black.opacity(0.5)]

        for _ in 0..<(isCorrect ? 30 : 20) {
            let particle = ConfettiParticle(
                x: CGFloat.random(in: 0...width),   
                y: -20,
                size: CGFloat.random(in: 8...14),
                rotation: Double.random(in: 0...360),
                color: colors.randomElement()!
            )
            particles.append(particle)
        }

        withAnimation(.easeOut(duration: 1.4)) {
            for i in particles.indices {
                particles[i].y = CGFloat.random(in: 700...1000)
                particles[i].rotation += Double.random(in: 200...500)
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            particles.removeAll()
        }
    }
}
