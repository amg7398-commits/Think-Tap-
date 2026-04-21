//
//  TriviaQuestionView.swift
//  ThinkTap
//
//  Created by Hussein Alzailaei on 3/25/26.
//

import SwiftUI

// @@@@@@@@@@@@@@@@@@@@@
// QUESTION VIEW
// @@@@@@@@@@@@@@@@@@@@@


struct TriviaQuestionView: View {

    var question: TriviaQuestion
    var subcategoryName: String
    
    @Binding var category: TriviaCategory
    var isTwoPlayer: Bool

    @Binding var currentTurn: Int
    @Binding var ticketsP1: Int
    @Binding var ticketsP2: Int

    var onAnswer: () -> Void

    @Environment(\.dismiss) var dismiss

    // Timer
    @State private var timeRemaining = 20
    @State private var timer: Timer?

    // Popup
    @State private var showResult = false
    @State private var isCorrect = false
    @State private var popupMessage = ""

    // Selected Answer
    @State private var selectedAnswer: String? = nil

    // Animations
    @State private var shakeOffset: CGFloat = 0
    @State private var pulseCorrect = false
    @State private var showConfetti = false

    var body: some View {

        GeometryReader { geo in
            let width = geo.size.width
            let isWide = width > 700

            ZStack {

                Color.blue.opacity(0.30)
                    .ignoresSafeArea()

                VStack(spacing: isWide ? 25 : 20) {

                    infoPanel(width: width)

                    Spacer(minLength: isWide ? 15 : 10)

                    questionBox(width: width)

                    answersGrid(width: width)

                    Spacer(minLength: isWide ? 15 : 10)

                    backButton()
                }
                .frame(maxWidth: isWide ? 700 : 500)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding(isWide ? 24 : 12)

                if showConfetti {
                    ConfettiView(isCorrect: isCorrect)
                }

                if showResult {
                    resultOverlay(width: width)
                }
            }
        }
        .onAppear { startTimer() }
        .onDisappear { stopTimer() }
    }

    //  Adaptive Helper
    func adaptive(_ small: CGFloat, _ large: CGFloat, width: CGFloat) -> CGFloat {
        width > 700 ? large : small
    }

    // INFO PANEL
    func infoPanel(width: CGFloat) -> some View {
        VStack(spacing: adaptive(6, 10, width: width)) {

            HStack {
                Image(systemName: "timer.circle.fill")
                    .font(.system(size: adaptive(22, 40, width: width)))

                Text("Time Remaining: \(timeRemaining)s")
                    .foregroundColor(timeRemaining <= 5 ? .red : .primary)
                    .font(.system(size: adaptive(22, 40, width: width), weight: .bold))
            }

            if isTwoPlayer {
                Text("Player Turn: Player \(currentTurn + 1)")
                    .font(.system(size: adaptive(22, 40, width: width), weight: .semibold))
                    .foregroundColor(.white)
            }

            HStack(spacing: adaptive(10, 20, width: width)) {

                HStack {
                    Image(systemName: "ticket.fill")
                        .font(.system(size: adaptive(18, 30, width: width), weight: .bold))

                    Text("Player 1: \(ticketsP1)")
                        .font(.system(size: adaptive(18, 30, width: width), weight: .bold))
                }

                if isTwoPlayer {
                    HStack {
                        Image(systemName: "ticket.fill")
                            .font(.system(size: adaptive(18, 30, width: width), weight: .bold))

                        Text("Player 2: \(ticketsP2)")
                            .font(.system(size: adaptive(18, 30, width: width), weight: .bold))
                    }
                }
            }
            .foregroundColor(.white)
        }
        .frame(maxWidth: 700)
        .padding(.vertical, adaptive(12, 20, width: width))
        .background(.gray.opacity(0.20))
        .cornerRadius(35)
        .shadow(radius: 4)
    }

    //  QUESTION
    func questionBox(width: CGFloat) -> some View {
        Text(question.question)
            .font(.system(size: adaptive(15, 30, width: width), weight: .bold))
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true) 
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(Color(UIColor.secondarySystemBackground).opacity(0.85))
            .cornerRadius(25)
            .shadow(radius: 4)
            .padding(width > 500 ? 30 : 15)
    }

    // ANSWERS
    func answersGrid(width: CGFloat) -> some View {

        let spacing = width > 700 ? 20 : 10

        return LazyVGrid(
            columns: [
                GridItem(.flexible(), spacing: CGFloat(spacing)),
                GridItem(.flexible(), spacing: CGFloat(spacing))
            ],
            spacing: CGFloat(spacing)
        ) {

            ForEach(question.options, id: \.self) { option in

                Button {
                    answerTapped(option)
                } label: {
                    Text(option)
                        .font(.system(size: adaptive(15, 26, width: width), weight: .semibold))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .minimumScaleFactor(0.7)
                        .frame(
                            maxWidth: .infinity,
                            minHeight: adaptive(55, 80, width: width),
                            maxHeight: adaptive(65, 90, width: width)
                        )
                        .padding(.horizontal, 10)
                        .background(buttonColor(option))
                        .foregroundColor(.primary)
                        .cornerRadius(16)
                        .opacity(showResult && option != question.correctAnswer ? 0.6 : 1)
                        .scaleEffect(scaleEffect(option))
                        .offset(x: offsetEffect(option))
                }
                .disabled(showResult)
            }
        }
        .padding(.horizontal, 10)
        .animation(.spring(), value: pulseCorrect)
    }

    // BACK BUTTON
    func backButton() -> some View {
        Button {
            stopTimer()
            dismiss()
        } label: {
            Label("Back to Board", systemImage: "arrow.left.circle.fill")
                .font(.title3.bold())
                .padding()
                .frame(maxWidth: 300)
                .background(Color(UIColor.systemGray2).opacity(0.6))
                .foregroundColor(.white)
                .cornerRadius(20)
        }
    }

    private var isGameOver: Bool {
        if isTwoPlayer {
            return ticketsP1 <= 0 || ticketsP2 <= 0
        } else {
            return ticketsP1 <= 0
        }
    }
    
    
    
    //  RESULT OVERLAY
    func resultOverlay(width: CGFloat) -> some View {
        ZStack {
            Color.black.opacity(0.55).ignoresSafeArea()

            VStack(spacing: adaptive(12, 18, width: width)) {

                Text(isCorrect ? "✅ Correct!" : "❌ Wrong!")
                    .font(.system(size: adaptive(24, 40, width: width), weight: .bold))
                    .foregroundColor(.white)

                Text(popupMessage)
                    .font(.system(size: adaptive(16, 22, width: width), weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)

                Button {
                    SoundManager.shared.playSound(name: "qclose")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        dismiss()
                    }
                } label: {
                    Text("Next Question")
                        .font(.system(size: adaptive(16, 18, width: width), weight: .bold))
                        .padding(.vertical, adaptive(10, 14, width: width))
                        .frame(maxWidth: .infinity)
                        .background(isGameOver ? Color.gray : Color.orange)                        .cornerRadius(18)
                        .foregroundColor(.white)
                }
                .disabled(isGameOver)
            }
            .padding(adaptive(16, 24, width: width))
            .frame(maxWidth: adaptive(320, 420, width: width))
            .background(Color.blue.opacity(0.80))
            .cornerRadius(28)
        }
    }

    // TIMER
    func startTimer() {
        timeRemaining = 20

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
                answerTapped("")
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    // ANSWER
    func answerTapped(_ answer: String) {

        guard !showResult else { return }

        stopTimer()
        selectedAnswer = answer
        isCorrect = (answer == question.correctAnswer)

        if isCorrect {
            SoundManager.shared.playCorrectSound()
//            SoundManager.shared.playSound(name: "correct")
            showConfetti = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                showConfetti = false
            }

            triggerPulse()
        } else {
            SoundManager.shared.playSound(name: "wrong")
            deductTickets()
            triggerShake()
        }

        markAnswered()
        onAnswer()

        popupMessage = "Correct Answer: \(question.correctAnswer)"

        withAnimation(.spring()) {
            showResult = true
        }
        // Only call onAnswer if game is over (0 tickets or all answered)
            if isGameOver {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        onAnswer() // Now checkGameOver() fires AFTER dismiss
                    }
                }
            } else {
                onAnswer()
            }
    }

    //  GAME LOGIC
    func deductTickets() {
        if isTwoPlayer {
            if currentTurn == 0 { ticketsP1 -= 1 }
            else { ticketsP2 -= 1 }

            currentTurn = (currentTurn == 0 ? 1 : 0)
        } else {
            ticketsP1 -= 2
        }
    }

    func buttonColor(_ option: String) -> Color {
        if !showResult { return Color(UIColor.secondarySystemBackground) }
        if option == question.correctAnswer { return .green }
        if option == selectedAnswer { return .red }
        return .gray.opacity(0.6)
    }

    func triggerShake() {
        withAnimation(.default.repeatCount(4, autoreverses: true)) {
            shakeOffset = 10
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            shakeOffset = 0
        }
    }

    func triggerPulse() {
        pulseCorrect.toggle()
    }

    func scaleEffect(_ option: String) -> CGFloat {
        if showResult && option == question.correctAnswer {
            return pulseCorrect ? 1.08 : 1.0
        }
        return 1.0
    }

    func offsetEffect(_ option: String) -> CGFloat {
        if showResult && option == selectedAnswer && !isCorrect {
            return shakeOffset
        }
        return 0
    }

    func markAnswered() {
        for subIndex in category.subcategories.indices {
            for qIndex in category.subcategories[subIndex].questions.indices {
                if category.subcategories[subIndex].questions[qIndex].id == question.id {
                    category.subcategories[subIndex].questions[qIndex].isAnswered = true
                    category.subcategories[subIndex].questions[qIndex].wasCorrect = isCorrect
                }
            }
        }
    }
}
