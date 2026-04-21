//
//  SuddenTriviaView.swift
//  ThinkTap
//
//  Created by Hussein Alzailaei on 3/25/26.
//

import SwiftUI

struct SuddenTriviaView: View {
    @Environment(\.horizontalSizeClass) private var sizeClass
    private var isPad: Bool { sizeClass == .regular }
    
    @Binding var scores: [Int]          // [Player1, Player2]
    @Binding var currentTurn: Int       // 0 = Player 1, 1 = Player 2
    @Binding var questionIndex: Int
    var questions: [TriviaQuestion]
    var onFinish: (String?) -> Void     // Called with winner name
    
    @State private var selectedAnswer: String? = nil
    @State private var showAnswerResult = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.blue.opacity(0.2).ignoresSafeArea()
                
                VStack(spacing: scaledValue(10, 10, geo: geo)) {
                    header
                    scoreBoard
                    Divider().padding(.vertical, scaledValue(10, 10, geo: geo))
                    questionSection(geo: geo)
                    Spacer(minLength: scaledValue(10, 10, geo: geo))
                }
                .frame(maxWidth: .infinity)
                .padding(.top, scaledValue(20, 10, geo: geo))
            }
        }
    }
    
    //  Header
    private var header: some View {
        VStack(spacing: 10) {
            Text("Sudden Trivia")
                .font(.system(size: isPad ? 36 : 24, weight: .bold))
                .foregroundColor(.blue)
            
            Text("Player \(currentTurn + 1)'s Turn")
                .font(.system(size: isPad ? 32 : 20, weight: .bold))
                .foregroundColor(.primary)
        }
    }
    
    //  Score Board
    private var scoreBoard: some View {
        HStack(spacing: isPad ? 40 : 20) {
            playerScoreBox(player: "Player 1", score: scores[0])
            playerScoreBox(player: "Player 2", score: scores[1])
        }
    }
    
    private func playerScoreBox(player: String, score: Int) -> some View {
        VStack {
            Text(player)
                .font(.system(size: isPad ? 20 : 16, weight: .semibold))
                .foregroundColor(.white)
            Text("\(score)")
                .font(.system(size: isPad ? 30 : 24, weight: .bold))
                .foregroundColor(.primary)
        }
        .frame(maxWidth: isPad ? 100 : 100)
        .padding(isPad ? 16 : 10)
        .background(Color.blue.opacity(0.25))
        .cornerRadius(20)
    }
    
    //  Question Section
    private func questionSection(geo: GeometryProxy) -> some View {
        Group {
            if questionIndex < questions.count {
                let q = questions[questionIndex]
                ScrollView {
                    VStack(spacing: scaledValue(10, 15, geo: geo)) {
                        // Question Text
                        Text(q.question)
                            .font(.system(size: isPad ? 36 : 22, weight: .semibold))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal, isPad ? 10 : 20)
                            .padding(.top, isPad ? 10 : 40)
                        //from here
                            .frame(width: isPad ? 600 : 300)
                            .clipped()
                            .background(Color.gray.opacity(0.15))
                            .cornerRadius(20)
                            .padding(.bottom, isPad ? 10 : 40)
                        
                        // Answer Buttons
                        VStack(spacing: scaledValue(20, 16, geo: geo)) {
                            ForEach(q.options, id: \.self) { ans in
                                Button(action: { selectAnswer(ans, correct: q.correctAnswer) }) {
                                    Text(ans)
                                        .font(.system(size: isPad ? 30 : 18, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(width: isPad ? 500 : 300)
                                        .padding(.vertical, isPad ? 20 : 12)
                                        .background(answerColor(ans))
                                        .cornerRadius(20)
                                        .scaleEffect(selectedAnswer == ans ? 1.05 : 1.0)
                                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: selectedAnswer)
                                }
                                .disabled(showAnswerResult)
                            }
                        }
                        .padding(.horizontal, isPad ? 20 : 20)
                        .padding(.bottom, isPad ? 20 : 20)
                    }
                    .frame(maxWidth: .infinity)
                }
                .transition(.opacity.combined(with: .scale))
            } else {
                Text("No more questions")
                    .font(.system(size: isPad ? 30 : 20, weight: .semibold))
                    .foregroundColor(.gray)
            }
        }
    }
    
    // Answer Color
    private func answerColor(_ answer: String) -> Color {
        guard showAnswerResult else { return Color.orange }
        if answer == questions[questionIndex].correctAnswer { return Color.green }
        if answer == selectedAnswer { return Color.red }
        return Color.gray.opacity(0.5)
    }
    
    //  Answer Selection
    private func selectAnswer(_ answer: String, correct: String) {
        selectedAnswer = answer
        showAnswerResult = true
        
        if answer == correct { scores[currentTurn] += 1 }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            moveNext()
        }
    }
    
    private func moveNext() {
        selectedAnswer = nil
        showAnswerResult = false
        
        if scores[0] == 2 { onFinish("Player 1"); return }
        if scores[1] == 2 { onFinish("Player 2"); return }
        
        currentTurn = 1 - currentTurn
        questionIndex += 1
        
        if questionIndex >= questions.count {
            if scores[0] > scores[1] { onFinish("Player 1") }
            else if scores[1] > scores[0] { onFinish("Player 2") }
            else { onFinish(nil) }
        }
    }
    
    // Scaling Helper
    private func scaledValue(_ pad: CGFloat, _ phone: CGFloat, geo: GeometryProxy) -> CGFloat {
        isPad ? pad : phone
    }
}


//////**************
////
struct TieBreakerIntroView: View {
    
    @Environment(\.horizontalSizeClass) private var sizeClass
    private var isPad: Bool { sizeClass == .regular }
    
    var onContinue: () -> Void
    
    @State private var animateText = false
    @State private var animateButton = false
    @State private var countdown: Int? = nil
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            
            VStack(spacing: isPad ? 50 : 30) {
                
                Spacer()
                
                // Tie Title
                Text("It's a Tie!")
                    .font(.system(size: isPad ? 72 : 42, weight: .heavy))
                    .foregroundColor(.blue)
                    .scaleEffect(animateText ? 1.1 : 0.9)
                    .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: animateText)
                
                // Subtitle
                Text("Get ready for Sudden Trivia!")
                    .font(.system(size: isPad ? 36 : 24, weight: .semibold))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, isPad ? 40 : 20)
                    .opacity(animateText ? 1 : 0.5)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animateText)
                
                Spacer()
                
                // Start Button / Countdown
                Button(action: startCountdown) {
                    if let count = countdown {
                        Text("\(count)")
                            .font(.system(size: isPad ? 96 : 64, weight: .black))
                            .foregroundColor(.primary)
                            .padding(.vertical, isPad ? 24 : 16)
                            .padding(.horizontal, isPad ? 60 : 40)
                            .background(Color.orange.opacity(0.8))
                            .cornerRadius(40)
                            .shadow(radius: 8)
                    } else {
                        Text("Start Sudden Trivia")
                            .font(.system(size: isPad ? 36 : 24, weight: .bold))
                            .padding(.vertical, isPad ? 24 : 16)
                            .padding(.horizontal, isPad ? 60 : 40)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                            .shadow(radius: 8)
                            .scaleEffect(animateButton ? 1.05 : 0.95)
                            .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: animateButton)
                    }
                }
                
                Spacer()
            }
            .onAppear {
                animateText = true
                animateButton = true
            }
        }
    }
    
    // Countdown Logic
    private func startCountdown() {
        guard countdown == nil else { return } // Prevent double-tap
        countdown = 3
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if let count = countdown, count > 1 {
                countdown = count - 1
            } else {
                timer.invalidate()
                countdown = nil
                onContinue()
            }
        }
    }
}


