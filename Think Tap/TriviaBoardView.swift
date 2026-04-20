//
//  TriviaBoardView.swift
//  ThinkTap
//
//  Created by Hussein Alzailaei on 3/25/26.
//

import SwiftUI
struct TriviaBoardView: View {
    @Binding var startBoard: Bool
   // @Binding var path: NavigationPath
    // Environment
    @Environment(\.horizontalSizeClass) private var sizeClass
    private var isPad: Bool { sizeClass == .regular }
    
    // Input
    @State var category: TriviaCategory
    var isTwoPlayer: Bool
    
    // Game State
    @State private var ticketsP1 = 20
    @State private var ticketsP2 = 20
    @State private var currentTurn = 0
    @State private var selectedQuestion: TriviaQuestion? = nil
    @State private var selectedSubcategoryName: String = ""
    
    // Hover & UI
    @State private var hoveredQuestionID: UUID? = nil
    @State private var showAlert = false
    @State private var alertTitle = ""
    
    // Game Over Screens
    @State private var showWinningScreen = false
    @State private var showLoseScreen = false
    @State private var winnerName: String? = nil
    
    // Sudden Trivia
    @State private var showSuddenTrivia = false
    @State private var suddenTriviaIndex = 0
    @State private var suddenTriviaScores = [0, 0]
    @State private var showTieIntro = false
    @State private var suddenQuestions: [TriviaQuestion] = []
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            
            VStack(spacing: isPad ? 10 : 15) {
                
                //  Help Button
                HStack {
                    Spacer()
                    NavigationLink {
                        GameInstructionsView()
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.system(size: isPad ? 32 : 28))
                            .foregroundColor(.white)
                            .padding(isPad ? 6 : 2)
                            .background(Color.blue.opacity(0.8))
                            .clipShape(Circle())
                    }
                }
                .tapSound()
                .padding(.horizontal, isPad ? 25 : 20)
                .padding(.top, isPad ? 10 : 10)
                
                // Category Title
                Text(category.name)
                    .font(.system(size: isPad ? 50 : 42, weight: .heavy))
                    .foregroundColor(.blue)
                
                //Scoreboard
                scoreboardCard()
                
                Divider()
                
                // Trivia Board
                boardGrid()
                    .padding(.bottom, isPad ? 30 : 30)
            }
        }
        .onAppear {
            ticketsP1 = isTwoPlayer ? 10 : 20
            ticketsP2 = isTwoPlayer ? 10 : 0
        }
        .onChange(of: winnerName) { oldValue, newValue in
            print("Winner set to:", newValue ?? "nil")
        }
        .fullScreenCover(item: $selectedQuestion) { q in
            TriviaQuestionView(
                question: q,
                subcategoryName: selectedSubcategoryName,
                category: $category,
                isTwoPlayer: isTwoPlayer,
                currentTurn: $currentTurn,
                ticketsP1: $ticketsP1,
                ticketsP2: $ticketsP2
            ) {
                checkGameOver()
            }
        }
        .fullScreenCover(isPresented: $showWinningScreen) {
            WinningView(
                startBoard: $startBoard,
                winnerName: winnerName,
                finalTickets: isTwoPlayer ? max(ticketsP1, ticketsP2) : ticketsP1,
                categoryName: category.name,
                categoryImage: category.imageName
                
            )
        }
        .fullScreenCover(isPresented: $showLoseScreen) {
            LosingView(
                startBoard: $startBoard,
                categoryName: category.name, categoryImage: category.imageName )
        }
        
        .fullScreenCover(isPresented: $showTieIntro) {
            TieBreakerIntroView {
                showTieIntro = false
                showSuddenTrivia = true
            }
        }

        .fullScreenCover(isPresented: $showSuddenTrivia) {
            SuddenTriviaView(
                scores: $suddenTriviaScores,
                currentTurn: $currentTurn,
                questionIndex: $suddenTriviaIndex,
                questions: suddenQuestions.shuffled(),
                onFinish: { winner in
                    showSuddenTrivia = false   //  CLOSE FIRST
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        winnerName = winner    //  SET DATA
                        showWinningScreen = true //  SHOW SCREEN
                    }
                }
            )
        }
        

    }
    func suddenTriviaQuestionsFromBoard() -> [TriviaQuestion] {
        let allQuestions = category.subcategories.flatMap { sub in
            sub.questions.map { q -> TriviaQuestion in
                var newQ = q
                newQ.isAnswered = false
                newQ.wasCorrect = nil
                return newQ
            }
        }
        
        return Array(allQuestions.shuffled().prefix(20))
    }
    //  Board Grid
    func boardGrid() -> some View {
        ScrollView {
            VStack(spacing: isPad ? 30 : 20) {
                
                // Subcategory Titles
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: isPad ? 18 : 12), count: category.subcategories.count),
                    spacing: isPad ? 18 : 12
                ) {
                    ForEach(category.subcategories.indices, id: \.self) { subIndex in
                        Text(category.subcategories[subIndex].name)
                            .font(.system(size: isPad ? 22 : 14, weight: .semibold))
                            .bold()
                        // .font(isPad ? .title2 : .headline)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .minimumScaleFactor(0.6)
                            .frame(maxWidth: .infinity, minHeight: isPad ? 50 : 50)
                            .padding(.vertical, isPad ? 5 : 8)
                            .background(Color.white)
                            .cornerRadius(10)
                    }

                }
                .padding(.horizontal, isPad ? 40 : 10)
                
                // Question Rows
                let questionCount = category.subcategories.first?.questions.count ?? 0
                ForEach(0..<questionCount, id: \.self) { row in
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible(), spacing: isPad ? 18 : 12), count: category.subcategories.count),
                        spacing: isPad ? 18 : 12
                    ) {
                        ForEach(category.subcategories.indices, id: \.self) { subIndex in
                            let q = category.subcategories[subIndex].questions[row]
                            questionButton(q: q, row: row, subIndex: subIndex)
                        }
                    }
                    .padding(.horizontal, isPad ? 40 : 16)
                }
            }
        }
    }
    
    // Question Button
    func questionButton(q: TriviaQuestion, row: Int, subIndex: Int) -> some View {
        Button {
            selectedSubcategoryName = category.subcategories[subIndex].name
            selectedQuestion = q
        } label: {
            Text("Q\(row + 1)")
                .font(.system(size: isPad ? 36 : 24, weight: .bold))
                .lineLimit(1)                    // Prevent overflow
                .minimumScaleFactor(0.5)         // Shrink text if needed
                .frame(height: isPad ? 85 : 55)
                .frame(maxWidth: .infinity)
                .background(
                    q.isAnswered
                    ? (q.wasCorrect == true ? Color.green.opacity(0.85) : Color.gray.opacity(0.65))
                    : Color.orange.opacity(0.9)
                )
                .cornerRadius(15)
                .scaleEffect(hoveredQuestionID == q.id ? 1.12 : 1.0)
                .rotation3DEffect(.degrees(hoveredQuestionID == q.id ? 8 : 0), axis: (x: 1, y: 0, z: 0))
                .shadow(color: hoveredQuestionID == q.id ? Color.white.opacity(0.6) : Color.clear, radius: 12)
                .animation(.spring(response: 0.25, dampingFraction: 0.6), value: hoveredQuestionID)
        }
        .tapSound()
        .disabled(q.isAnswered)
        .buttonStyle(.plain)
        .simultaneousGesture(TapGesture().onEnded {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        })
        .onHover { hovering in
            hoveredQuestionID = hovering ? q.id : nil
        }
    }
    
    // Scoreboard
    func scoreboardCard() -> some View {
        VStack(spacing: isPad ? 10 : 8) {

            if isTwoPlayer {

                Text("Turn: Player \(currentTurn + 1)")
                    .font(.system(size: isPad ? 22 : 16, weight: .bold))
                    .foregroundColor(.primary)

                HStack {
                    scoreBoxWithIcon(title: "Player 1", value: ticketsP1)
                    scoreBoxWithIcon(title: "Player 2", value: ticketsP2)
                }

            } else {

                HStack(spacing: isPad ? 10 : 8) {
                    Image(systemName: "ticket.fill")
                        .font(.system(size: isPad ? 28 : 18, weight: .semibold))
                        .foregroundColor(.blue)
                    Text("Tickets Remaining:")
                        .font(.system(size: isPad ? 20 : 14, weight: .semibold))
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)

                    Text("\(ticketsP1)")
                        .font(.system(size: isPad ? 32 : 22, weight: .bold))
                        .foregroundColor(.blue)
                }
                .padding(.horizontal)
                .padding(.vertical, isPad ? 10 : 6)
                .background(Color.white.opacity(0.9))
                .cornerRadius(12)
            }
        }
        .padding(isPad ? 0 : 10)
        .frame(maxWidth: isPad ? 700 : .infinity)
        
        .padding(.horizontal, isPad ? 0 : 10)
    }
    
    func scoreBoxWithIcon(title: String, value: Int) -> some View {
//        HStack {
//            Image(systemName: "ticket.fill")
//                .font(.system(size: isPad ? 40 : 20))
//                .foregroundColor(.blue)

            VStack {
                Text(title)
                    .font(.system(size: isPad ? 16 : 12, weight: .semibold))
                    .foregroundColor(.primary)
                HStack {
                    Image(systemName: "ticket.fill")
                        .font(.system(size: isPad ? 40 : 20))
                        .foregroundColor(.blue)
                Text("\(value)")
                    .font(.system(size: isPad ? 22 : 16, weight: .bold))
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity)
            .padding(isPad ? 12 : 8)
            .background(.blue.opacity(0.25))
            .cornerRadius(20)
        }
    }
    
    //  Game Logic
    func allQuestionsAnswered() -> Bool {
        category.subcategories.allSatisfy { $0.questions.allSatisfy { $0.isAnswered } }
    }
    

    
    func checkGameOver() {
        
        // Single player lose
        if !isTwoPlayer, ticketsP1 <= 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showLoseScreen = true
                    }
            return
        }
        
        // Two player instant win
        if isTwoPlayer {
            if ticketsP1 <= 0 {
                winnerName = "Player 2"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showWinningScreen = true
                            }
                return
            }
            if ticketsP2 <= 0 {
                winnerName = "Player 1"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showWinningScreen = true
                            }
                return
            }
        }
        
        // Check when all questions finished
        if allQuestionsAnswered() {
            if isTwoPlayer {
                if ticketsP1 > ticketsP2 {
                    winnerName = "Player 1"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        showWinningScreen = true
                                    }                } else if ticketsP2 > ticketsP1 {
                    winnerName = "Player 2"
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                            showWinningScreen = true
                                                        }                } else {
                    // Tie → Sudden Trivia
                    suddenTriviaScores = [0,0]
                    suddenTriviaIndex = 0
                    suddenQuestions = suddenTriviaQuestions.shuffled()
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                                                showTieIntro = true
                                                                            }
                }
            } else {
                // Single player win
                winnerName = nil
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showWinningScreen = true
                            }            }
        }
    }
}
