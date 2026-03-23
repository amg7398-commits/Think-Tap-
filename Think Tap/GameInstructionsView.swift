//
//  GameInstructionsView.swift
//  ThinkTap
//
//  Created by Hussein Alzailaei on 2/9/26.
//


//import SwiftUI
//
//struct GameInstructionsView: View {
//
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 25) {
//
//                // ⭐ Title
//                Text("Game Instructions")
//                    .font(.largeTitle.bold())
//                    .padding(.top, 20)
//
//                // ✅ One Player Section
//                InstructionCard(
//                    title: "One-Player Mode",
//                    icon: "person.fill",
//                    color: .blue,
//                    text: """
//When playing One-Player mode, you’ll be competing against the trivia board!
//
//• Begin with 20 tickets  
//• Each incorrect answer deducts 2 tickets  
//• Reach 0 tickets = you lose  
//• Clear the board with tickets left = you win  
//• Correct answers do not award tickets  
//
//Answer carefully to secure victory!
//"""
//                )
//
//                // ✅ Two Player Section
//                InstructionCard(
//                    title: "Two-Player Mode",
//                    icon: "person.2.fill",
//                    color: .green,
//                    text: """
//In Two-Player mode, you’ll compete against another player.
//
//• Each player begins with 10 tickets  
//• Players take turns answering questions  
//• Incorrect answers deduct 1 ticket  
//• Correct answers do not earn tickets  
//• First player to reach 0 tickets loses  
//
//If the board is cleared and scores are tied, Sudden Trivia begins!
//"""
//                )
//
//                // ✅ Sudden Trivia Section
//                InstructionCard(
//                    title: "Sudden Trivia Round",
//                    icon: "bolt.fill",
//                    color: .orange,
//                    text: """
//Sudden Trivia is a best-of-three showdown!
//
//• Two players compete quickly  
//• First player to win 2 out of 3 questions wins  
//• Starting player is opposite from the previous game  
//
//Fast, intense, and fun!
//"""
//                )
//            }
//            .padding()
//        }
//        .background(Color.gray.opacity(0.10))
//        .navigationTitle("Help")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//#Preview {
//    NavigationStack {
//        GameInstructionsView()
//    }
//}



