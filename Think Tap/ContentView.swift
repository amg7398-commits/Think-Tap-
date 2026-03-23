import SwiftUI




// @@@@@@@@@@@@@@@@@@@@@
// START SCREEN
// @@@@@@@@@@@@@@@@@@@@@







struct StartGameView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    @State private var players = 1
    @State private var selectedCategory: TriviaCategory? = nil
    @State private var startBoard = false
    @State private var didPlaySound = false
    var showTopStartButton: Bool {
        guard let selected = selectedCategory else { return false }
        return selected.id == fullBoardData.first?.id ||
               selected.id == fullBoardData.last?.id
    }
    var isIPad: Bool { sizeClass == .regular }
    

        func startGame() {
            
            guard selectedCategory != nil else { return }
            
            HapticManager.shared.medium()
            SoundManager.shared.playSound(name: "start")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                startBoard = true
            }
        }
    var body: some View {
        
        NavigationStack {
            
            GeometryReader { geo in
                
                let width = geo.size.width
                
                let titleSize = isIPad ? 60.0 : 36.0
                let sectionTitleSize = isIPad ? 34.0 : 22.0
                let buttonFontSize = isIPad ? 26.0 : 18.0
                let horizontalPadding = isIPad ? 60.0 : 20.0
                
                let columns = [
                    GridItem(.adaptive(minimum: isIPad ? 260 : 150),
                             spacing: isIPad ? 30 : 20)
                ]
                
                ZStack {
                    
                    LinearGradient(
                        colors: [Color.blue.opacity(0.25), Color.white],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                        .contentShape(Rectangle())
                        .onTapGesture {
                            startGame()
                        }

                    ScrollView(showsIndicators: false) {
                        
                        VStack(spacing: isIPad ? 10 : 5) {
                            
                            // Help Button
                            HStack {
                                Spacer()
                                
                                NavigationLink {
                                    GameInstructionsView()
                                } label: {
                                    Image(systemName: "questionmark.circle.fill")
                                        .font(.system(size: isIPad ? 32 : 28))
                                        .foregroundColor(.white)
                                      //  .padding()
                                        .background(Color.blue.opacity(0.85))
                                        .clipShape(Circle())
                                     //   .shadow(radius: 2)
                                }
                            }
                            
                            // Title
                            HStack(spacing: 20) {
                                
                                Image("Logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: isIPad ? 90 : 50)
                                
                                Text("Think Tap")
                                    .font(.custom("Kefa III", size: titleSize))
                                    .bold()
                                    .foregroundColor(.blue)
                            }
                            
                            // Player Selection
                            VStack(spacing: 20) {
                                
                                Text("Choose Players")
                                    .font(.system(size: sectionTitleSize, weight: .bold))
                                
                                HStack(spacing: isIPad ? 60 : 20) {
                                    
                                    PlayerCard(
                                        title: "1 Player",
                                        icon: "person.fill",
                                        isSelected: players == 1,
                                        isIPad: isIPad
                                    )
                                    .onTapGesture {
                                        SoundManager.shared.playSound(name: "tap")
                                        HapticManager.shared.light()
                                        
                                        withAnimation(.spring()) {
                                            players = 1
                                        }
                                    }
                                    
                                    PlayerCard(
                                        title: "2 Players",
                                        icon: "person.2.fill",
                                        isSelected: players == 2,
                                        isIPad: isIPad
                                    )
                                    .onTapGesture {
                                        SoundManager.shared.playSound(name: "tap")
                                        HapticManager.shared.light()
                                        
                                        withAnimation(.spring()) {
                                            players = 2
                                        }
                                    }
                                }
                            }
                            
                            // Categories
                            VStack(spacing: 20) {
                                
                                Text("Choose Category")
                                    .font(.system(size: sectionTitleSize, weight: .bold))
                                
                                LazyVGrid(columns: columns, spacing: 30) {
                                    
                                    ForEach(fullBoardData) { category in
                                        
                                        CategoryCard(
                                            category: category,
                                            isSelected: selectedCategory?.id == category.id,
                                            isIPad: isIPad
                                        )
                                        .onTapGesture {
                                            SoundManager.shared.playSound(name: "tap")
                                            HapticManager.shared.light()
                                            
                                            withAnimation(.spring()) {
                                                selectedCategory = category
                                            }
                                        }
                                    }
                                }
                            }
                            
             
                        }
                        .padding(.horizontal, horizontalPadding)
                        .padding(.top, 20)
                        .frame(maxWidth: isIPad ? 900 : .infinity)
                        .frame(maxWidth: .infinity)
                    }
                    if selectedCategory != nil {
                           VStack {
                               Spacer()
                               Button(action: startGame) {
                                   Text("Start Game")
                                       .font(.system(size: buttonFontSize, weight: .bold))
                                       .frame(maxWidth: isIPad ? 400 : 200)
                                       //.frame(maxWidth: 200)
                                       .padding(.vertical, isIPad ? 22 : 16)
                                       .background(Color.orange)
                                       .foregroundColor(.black)
                                       .clipShape(RoundedRectangle(cornerRadius: 40))
                                       .shadow(radius: 5)
                               }
                               .padding(.bottom, isIPad ? 40 : 20)
                               .transition(.move(edge: .bottom).combined(with: .opacity))
                              // .animation(.spring(), value: selectedCategory)
                           }
                       }
                }
                .onAppear {
                    
                    if !didPlaySound {
                        SoundManager.shared.playSound(name: "start")
                        didPlaySound = true
                    }
                }
                
                
            }
            
            .navigationDestination(isPresented: $startBoard) {
                
                TriviaBoardView(
                    category: selectedCategory ?? fullBoardData[0],
                    isTwoPlayer: players == 2
                )
            }
           
//            Button(action: startGame) {
//                Text("Start Game")
//                    .font(.system(size: 22, weight: .bold))
//                    .frame(maxWidth: 500)
//                    .padding(.vertical, isIPad ? 22 : 16)
//                    .background(selectedCategory == nil ? Color.gray.opacity(0.3)
//                                                            : Color.orange
//                                                        )
//                                                        .foregroundColor(.black)
//                                                        .clipShape(RoundedRectangle(cornerRadius: 40))
//                    .font(.system(size: 22, weight: .bold))
//                    .frame(maxWidth: .infinity)
//                    .padding(.vertical, 16)
//                    .background(Color.orange)
//                    .foregroundColor(.black)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
////                    .padding(.horizontal)
////                    .padding(.top, 10)
    //        }
        }
        
    }
}






// Player Card Component
struct PlayerCard: View {
    
    let title: String
    let icon: String
    let isSelected: Bool
    let isIPad: Bool
    
    var body: some View {
        
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: isIPad ? 30 : 20))
                .foregroundColor(.blue)
            
            Text(title)
                .font(.system(size: isIPad ? 22 : 16, weight: .bold))
        }
        .padding()
        .frame(width: isIPad ? 220 : 150,
               height: isIPad ? 90 : 65)
        .background(isSelected ? Color.orange.opacity(0.9) : Color.white.opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: isSelected ? 8 : 4)
        .scaleEffect(isSelected ? 1.05 : 1)
    }
}






// Category Card Component
struct CategoryCard: View {
    
    let category: TriviaCategory
    let isSelected: Bool
    let isIPad: Bool
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            Image(category.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: isIPad ? 150 : 90)
                .frame(maxWidth: .infinity)
                .clipped()
                .cornerRadius(16)
            
            Text(category.name)
                .font(.system(size: isIPad ? 24 : 16, weight: .bold))
                .foregroundColor(.blue)
        }
        .padding()
        .frame(height: isIPad ? 220 : 160)
        .background(isSelected ? Color.orange.opacity(0.7) : Color.white.opacity(0.85))
        .cornerRadius(25)
        .shadow(radius: isSelected ? 10 : 5)
        .scaleEffect(isSelected ? 1.05 : 1)
    }
}





struct TriviaBoardView: View {
    
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
            
            VStack(spacing: isPad ? 15 : 15) {
                
                //  Help Button
                HStack {
                    Spacer()
                    NavigationLink {
                        GameInstructionsView()
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.system(size: isPad ? 50 : 34, weight: .bold))
                            .foregroundColor(.white)
                            .padding(isPad ? 6 : 2)
                            .background(Color.blue.opacity(0.8))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, isPad ? 40 : 20)
                .padding(.top, isPad ? 20 : 10)
                
                // Category Title
                Text(category.name)
                    .font(.system(size: isPad ? 70 : 42, weight: .heavy))
                    .foregroundColor(.blue)
                
                //Scoreboard
                scoreboardCard()
                
                Divider()
                
                // Trivia Board
                boardGrid()
                    .padding(.bottom, isPad ? 60 : 30)
            }
        }
        .onAppear {
            ticketsP1 = isTwoPlayer ? 10 : 20
            ticketsP2 = isTwoPlayer ? 10 : 0
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
                winnerName: winnerName,
                finalTickets: isTwoPlayer ? max(ticketsP1, ticketsP2) : ticketsP1,
                categoryName: category.name,
                categoryImage: category.imageName
            )
        }
        .fullScreenCover(isPresented: $showLoseScreen) {
            LosingView(categoryName: category.name, categoryImage: category.imageName)
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
                questions: suddenQuestions,
                onFinish: { winner in
                    winnerName = winner
                    showWinningScreen = true
                    showSuddenTrivia = false
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
                            .font(isPad ? .title : .headline)
                            .bold()
                            .foregroundColor(.blue)
                            .lineLimit(1)                    // Prevent multiple lines
                            .minimumScaleFactor(0.5)         // Scale down text if needed
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, isPad ? 22 : 14)
                            .background(.brown.opacity(0.4))
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, isPad ? 40 : 16)
                
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
        VStack(spacing: isPad ? 12 : 8) {

            if isTwoPlayer {

                Text("Turn: Player \(currentTurn + 1)")
                    .font(.system(size: isPad ? 22 : 16, weight: .bold))
                    .foregroundColor(.black)

                HStack {
                    scoreBoxWithIcon(title: "Player 1", value: ticketsP1)
                    scoreBoxWithIcon(title: "Player 2", value: ticketsP2)
                }

            } else {

                HStack {
                    Image(systemName: "ticket.fill")
                        .font(.system(size: isPad ? 30 : 18))
                        .foregroundColor(.blue)

                    Text(": Tickets Remaining")
                        .font(.system(size: isPad ? 22 : 16, weight: .bold))
                        .foregroundColor(.red)

                    Text("\(ticketsP1)")
                        .font(.system(size: isPad ? 34 : 20, weight: .heavy))
                        .foregroundColor(.black)
                }
            }
        }
        .padding(isPad ? 16 : 10)
        .frame(maxWidth: isPad ? 720 : .infinity)
        
        .padding(.horizontal, isPad ? 0 : 10)
        .background(.brown.opacity(0.15))
        .cornerRadius(30)
    }
    
    func scoreBoxWithIcon(title: String, value: Int) -> some View {
        HStack {
            Image(systemName: "ticket.fill")
                .font(.system(size: isPad ? 40 : 20))
                .foregroundColor(.blue)

            VStack {
                Text(title)
                    .font(.system(size: isPad ? 16 : 12, weight: .semibold))
                    .foregroundColor(.white)

                Text("\(value)")
                    .font(.system(size: isPad ? 22 : 16, weight: .bold))
                    .foregroundColor(.black)
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
    
//    func suddenTriviaQuestionsFromBoard() -> [TriviaQuestion] {
//        category.subcategories.flatMap { sub in
//            sub.questions.map { q in
//                var newQ = q
//                newQ.isAnswered = false
//                return newQ
//            }
//        }.shuffled()
//    }
    
    func checkGameOver() {
        
        // Single player lose
        if !isTwoPlayer, ticketsP1 <= 0 {
            showLoseScreen = true
            return
        }
        
        // Two player instant win
        if isTwoPlayer {
            if ticketsP1 <= 0 {
                winnerName = "Player 2"
                showWinningScreen = true
                return
            }
            if ticketsP2 <= 0 {
                winnerName = "Player 1"
                showWinningScreen = true
                return
            }
        }
        
        // Check when all questions finished
        if allQuestionsAnswered() {
            if isTwoPlayer {
                if ticketsP1 > ticketsP2 {
                    winnerName = "Player 1"
                    showWinningScreen = true
                } else if ticketsP2 > ticketsP1 {
                    winnerName = "Player 2"
                    showWinningScreen = true
                } else {
                    // Tie → Sudden Trivia
                    suddenTriviaScores = [0,0]
                    suddenTriviaIndex = 0
                    suddenQuestions = suddenTriviaQuestionsFromBoard()
                    showTieIntro = true
                }
            } else {
                // Single player win
                winnerName = nil
                showWinningScreen = true
            }
        }
    }
    }









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
    @State private var timeRemaining = 15
    @State private var timer: Timer?

    //  Popup
    @State private var showResult = false
    @State private var isCorrect = false
    @State private var popupMessage = ""

    // Selected Answer
    @State private var selectedAnswer: String? = nil
    @Environment(\.horizontalSizeClass) var sizeClass
    var isIPad: Bool { sizeClass == .regular }
    // Animations
    @State private var shakeOffset: CGFloat = 0
    @State private var pulseCorrect = false
    // Confetti Trigger
    @State private var showConfetti = false
    //  Adaptive Grid (Perfect for iPad and iphone)
    var answerColumns: [GridItem] {
        [
            GridItem(.flexible(), spacing: isIPad ? 18 : 10),
            GridItem(.flexible(), spacing: isIPad ? 18 : 10)
        ]
    }

    var body: some View {

        ZStack {

            //  Background
            Color.blue.opacity(0.30)
                .ignoresSafeArea()

            VStack(spacing: 25) {

                //  TOP INFO PANEL
                
                infoPanel()

                Spacer()

                
                //  QUESTION BOX
                
                questionBox()

                Text("Tap your answer below.")
                    .font(.system(size: isIPad ? 40 : 18, weight: .semibold))
                    .padding(isIPad ? 40 : 10)
                    .bold()
                    .background(Color.orange.opacity(0.80))
                    .cornerRadius(20)

                //  ANSWERS GRID
                
                answersGrid()

                Spacer()

                
                //  BACK BUTTON
            
                backButton()
            }
            .frame(maxWidth: isIPad ? 900 : .infinity)
            .frame(maxWidth: .infinity)
            .padding(isIPad ? 20 : 10)

            //  CONFETTI EFFECT
               if showConfetti {
                   ConfettiView(isCorrect: isCorrect)
               }
            
            
            
            //  POPUP RESULT OVERLAY
            
            if showResult {
                resultOverlay()
            }
        }
        .onAppear { startTimer() }
        .onDisappear { stopTimer() }
    }

    //  INFO PANEL
    func infoPanel() -> some View {
        VStack(spacing: isIPad ? 10 : 6) {

            // Category Title
            Text(subcategoryName)
                .font(.custom("Kafa III", size: isIPad ? 80 : 32))
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)

            // Player Turn
            if isTwoPlayer {
                Text("Player Turn: Player \(currentTurn + 1)")
                    .font(.system(size: isIPad ? 35 : 18, weight: .semibold))
                    .foregroundColor(.white)
            }

            // Timer
            HStack {
                Image(systemName: "timer.circle.fill")
                    .font(.system(size: isIPad ? 35 : 18))
                    .foregroundColor(.white)

                Text(" Time Remaining : \(timeRemaining) s")
                    .foregroundColor(timeRemaining <= 5 ? .red : .black)
                    .font(.system(size: isIPad ? 35 : 18, weight: .bold))
            }

            // Tickets
            HStack(spacing: isIPad ? 20 : 10) {

                HStack {
                    Image(systemName: "ticket.fill")
                        .font(.system(size: isIPad ? 28 : 16, weight: .bold))
                        .foregroundColor(.black)

                    Text(" Player 1 : \(ticketsP1)")
                        .font(.system(size: isIPad ? 28 : 16, weight: .bold))
                }

                if isTwoPlayer {
                    HStack {
                        Image(systemName: "ticket.fill")
                            .font(.system(size: isIPad ? 28 : 16, weight: .bold))
                            .foregroundColor(.black)

                        Text(" Player 2 : \(ticketsP2)")
                            .font(.system(size: isIPad ? 28 : 16, weight: .bold))
                    }
                }
            }
            .foregroundColor(.white)
        }
        .frame(maxWidth: isIPad ? 700 : .infinity)
        .padding(.horizontal, isIPad ? 0 : 10)
        .padding(.vertical, isIPad ? 20 : 12)
        .background(.black.opacity(0.10))
        .cornerRadius(35)
        .shadow(radius: 8)
    }

    // QUESTION BOX
    func questionBox() -> some View {
        Text(question.question)
            .font(.custom("Sinhala MN", size: isIPad ? 30 : 22))
            .fontWeight(.bold)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.35))
            .cornerRadius(25)
            .shadow(radius: 6)
            .padding(isIPad ? 35 : 15)
            .transition(.asymmetric(
                insertion: .scale.combined(with: .opacity),
                removal: .opacity
            ))
    }
    
    
    
    
    
    // ANSWERS GRID
    func answersGrid() -> some View {
        LazyVGrid(columns: answerColumns, spacing: 18) {

            ForEach(question.options, id: \.self) { option in

                Button {
                    answerTapped(option)
                } label: {
                    Text(option)
                        .font(.custom("Bodoni 72", size: isIPad ? 32 : 16))
                        .padding(.vertical, isIPad ? 18 : 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.70))
                        .background(buttonColor(option))
                        .foregroundColor(.black)
                        .bold()
                        .cornerRadius(25)
                        .shadow(radius: 5)
                        .opacity(showResult && option != question.correctAnswer ? 0.6 : 1)
                        // Animations
                        .scaleEffect(scaleEffect(option))
                        .offset(x: offsetEffect(option))
                }
                .disabled(showResult)
            }
        }
        .padding(.horizontal, 10)
        .animation(.spring(), value: pulseCorrect)
    }

    //  BACK BUTTON
    func backButton() -> some View {
        Button {
            stopTimer()
            dismiss()
        } label: {
            Label("Back to Board", systemImage: "arrow.left.circle.fill")
                .font(.title3.bold())
                .padding()
                .frame(maxWidth: 300)
                .background(Color.black.opacity(0.35))
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(radius: 6)
        }
    }

    // RESULT OVERLAY
    func resultOverlay() -> some View {
        ZStack {

            Color.black.opacity(0.55)
                .ignoresSafeArea()

            VStack(spacing: isIPad ? 18 : 12) {

                // Title
                Text(isCorrect ? "✅ Correct!" : "❌ Wrong!")
                    .font(.system(size: isIPad ? 40 : 24, weight: .bold))
                    .foregroundStyle(Color.white)
                    .padding(isIPad ? 16 : 5)

                // Message
                Text(popupMessage)
                    .font(.system(size: isIPad ? 22 : 16, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, isIPad ? 10 : 5)

                // Button
                Button {
                    SoundManager.shared.playSound(name: "qclose")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        dismiss()
                    }
                } label: {
                    Text("Next Question")
                        .font(.system(size: isIPad ? 18 : 16, weight: .bold))
                        .padding(.vertical, isIPad ? 14 : 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(18)
                        .foregroundColor(.white)
                }
            }
            .padding(isIPad ? 24 : 16)
            .frame(maxWidth: isIPad ? 420 : 320)
            .background(Color.blue.opacity(0.80))
            .cornerRadius(28)
            .shadow(radius: 12)
            .padding(.horizontal, 20)
        }
        .transition(.opacity)
    }

    //  TIMER
    func startTimer() {
        timeRemaining = 15

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
                answerTapped("") // timeout = wrong
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    //  ANSWER TAP
    func answerTapped(_ answer: String) {

        guard !showResult else { return }

        stopTimer()
        selectedAnswer = answer

        // Check Answer
        isCorrect = (answer == question.correctAnswer)

        //  Correct Answer
        if isCorrect {

            SoundManager.shared.playSound(name: "correct")

            //  Confetti ONLY for correct
            showConfetti = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                showConfetti = false
            }

            triggerPulse()

        }
        // ❌ Wrong Answer
        else {

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
    }


    //  TICKETS
    func deductTickets() {
        if isTwoPlayer {
            if currentTurn == 0 { ticketsP1 -= 1 }
            else { ticketsP2 -= 1 }

            currentTurn = (currentTurn == 0 ? 1 : 0)

        } else {
            ticketsP1 -= 2
        }
    }

    //  BUTTON COLOR
    func buttonColor(_ option: String) -> Color {
        if !showResult { return .orange }

        if option == question.correctAnswer {
            return .green
        }

        if option == selectedAnswer {
            return .red
        }

        return .gray.opacity(0.5)
    }

    //  ANIMATIONS
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

    //ANSWERED
    func markAnswered() {

        for subIndex in category.subcategories.indices {
            for qIndex in category.subcategories[subIndex].questions.indices {

                if category.subcategories[subIndex].questions[qIndex].id == question.id {

                    category.subcategories[subIndex].questions[qIndex].isAnswered = true

                    //  Store correct or wrong
                    category.subcategories[subIndex].questions[qIndex].wasCorrect = isCorrect
                }
            }
        }
    }

}


//  WINNING SCREEN



struct WinningView: View {
    var winnerName: String?   // nil for single player
    var finalTickets: Int

    var categoryName: String
    var categoryImage: String

    @Environment(\.dismiss) var dismiss
    @Environment(\.horizontalSizeClass) var sizeClass
    var isIPad: Bool { sizeClass == .regular }

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.1)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: isIPad ? 30 : 15) {
                Spacer(minLength: isIPad ? 20 : 10)

                // Congratulation Text
                VStack(spacing: isIPad ? 8 : 4) {
                    Text(" Congratulations! ")
                        .font(.system(size: isIPad ? 55 : 28, weight: .bold))
                        .foregroundStyle(Color.blue)
                        .multilineTextAlignment(.center)
                        .padding(isIPad ? 25 : 12)

                    Text("You won the board!")
                        .font(.system(size: isIPad ? 34 : 20, weight: .bold))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(isIPad ? 20 : 10)

                // Winner Name (Only for 2 players)
                if let winner = winnerName {
                    Text("Winner: \(winner)")
                        .font(.system(size: isIPad ? 34 : 18, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.top, isIPad ? 5 : 2)
                }

                // Category Card
                VStack(spacing: isIPad ? 15 : 10) {
                    Image(categoryImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: isIPad ? 200 : 120, height: isIPad ? 200 : 120)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)

                    Text(categoryName)
                        .font(.system(size: isIPad ? 28 : 18, weight: .bold))
                        .foregroundColor(.black)
                        .shadow(radius: 5)
                }
                .padding(isIPad ? 15 : 10)
                .background(Color.blue.opacity(0.25))
                .cornerRadius(25)
                .shadow(radius: 10)
                .padding(isIPad ? 10 : 5)

                // Final Tickets
                HStack {
                    Image(systemName: "ticket.fill")
                        .font(.system(size: isIPad ? 40 : 22, weight: .bold))
                        .foregroundColor(.blue)
                    Text(" Final Tickets: \(finalTickets)")
                        .font(.system(size: isIPad ? 34 : 20, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.top, isIPad ? 15 : 5)
                }

                Spacer()

                // Back Button
                Button(action: {
                    dismiss()
                    dismiss() // Dismiss twice to go back to main
                  //  dismiss()
                }) {
                    Text("Back to Categories")
                        .font(.system(size: isIPad ? 22 : 16, weight: .bold))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding(isIPad ? 16 : 10)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                }
                .padding(.horizontal, isIPad ? 30 : 15)
                .padding(.bottom, isIPad ? 30 : 15)
            }
            .onAppear {
                SoundManager.shared.playSound(name: "wingame")
            }
        }
    }
}

//LOSING SCREEN
struct LosingView: View {

    var categoryName: String
    var categoryImage: String

    @Environment(\.dismiss) var dismiss
    @Environment(\.horizontalSizeClass) var sizeClass
    var isIPad: Bool { sizeClass == .regular }

    var body: some View {
        ZStack {
            Color.blue.opacity(0.20)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: isIPad ? 30 : 15) {

                   
                    Text("Oh No!")
                        .font(.system(size: isIPad ? 90 : 50, weight: .heavy))
                        .foregroundColor(.red)
                        .shadow(radius: 5)
                        .padding(isIPad ? 30 : 15)

                    
                    Text("You Lost the board!")
                        .font(.system(size: isIPad ? 55 : 28, weight: .bold))
                        .foregroundStyle(Color.blue)
                        .padding(isIPad ? 60 : 20)

                    // Category Card
                    VStack(spacing: isIPad ? 5 : 3) {
                        Image(categoryImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: isIPad ? 200 : 120, height: isIPad ? 200 : 120)
                            .clipShape(RoundedRectangle(cornerRadius: isIPad ? 60 : 30))
                            .shadow(radius: 20)

                        Text(categoryName)
                            .font(.system(size: isIPad ? 28 : 16, weight: .bold))
                            .foregroundColor(.black)
                            .bold()
                    }
                    .padding()
                    .background(Color.accentColor.opacity(0.30))
                    .cornerRadius(isIPad ? 30 : 15)
                    .shadow(radius: 20)
                    .padding(isIPad ? 60 : 20)

                    // Final Tickets
                    HStack {
                        Image(systemName: "ticket.fill")
                            .font(.system(size: isIPad ? 40 : 22, weight: .bold))
                            .foregroundColor(.blue)
                        Text("Final Tickets: 0")
                            .font(.system(size: isIPad ? 55 : 28, weight: .bold))
                            .foregroundStyle(Color.blue)
                    }.padding(isIPad ? 50 : 25)

//                    Spacer()
//                    Spacer()
                    // Back Button
                    Button {
                        dismiss()
                        dismiss() // go back to root
                    } label: {
                        Text("Back to topic categories")
                            .font(.system(size: isIPad ? 22 : 16, weight: .bold))
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding(isIPad ? 16 : 10)
                            .background(Color.white)
                            .cornerRadius(isIPad ? 40 : 30)
                            .shadow(radius: 8)
                    }
                    .padding(.horizontal, isIPad ? 30 : 15)
                }
                .padding(.top, isIPad ? 70 : 30)
            }
        }
        .onAppear {
            SoundManager.shared.playSound(name: "lostgame")
        }
    }
}

//**************
 




struct SuddenTriviaView: View {
    
    @Environment(\.horizontalSizeClass) private var sizeClass
    private var isPad: Bool { sizeClass == .regular }
    @State private var didUseSuddenTrivia = false
    @Binding var scores: [Int]          // [Player1, Player2]
    @Binding var currentTurn: Int       // 0 = Player 1, 1 = Player 2
    @Binding var questionIndex: Int
    var questions: [TriviaQuestion]
    var onFinish: (String?) -> Void     // Called with winner name
    
    @State private var selectedAnswer: String? = nil
    @State private var showAnswerResult = false
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            
            VStack(spacing: isPad ? 50 : 30) {
                
                // Player Turn
                Text("Player \(currentTurn + 1)'s Turn")
                    .font(.system(size: isPad ? 36 : 24, weight: .bold))
                    .foregroundColor(.black)
                
                // Scoreboard
                HStack(spacing: isPad ? 40 : 20) {
                    playerScoreBox(player: "Player 1", score: scores[0])
                    playerScoreBox(player: "Player 2", score: scores[1])
                }
                
                Divider().padding(.vertical, isPad ? 20 : 10)
                
                // Current Question
                if questionIndex < questions.count {
                    let q = questions[questionIndex]
                    
                    VStack(spacing: isPad ? 40 : 20) {
                        Text(q.question)
                            .font(.system(size: isPad ? 36 : 22, weight: .semibold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, isPad ? 40 : 20)
                        
                        VStack(spacing: isPad ? 30 : 16) {
                            ForEach(q.options, id: \.self) { ans in // <-- Fixed property
                                Button(action: {
                                    selectAnswer(ans, correct: q.correctAnswer)
                                }) {
                                    Text(ans)
                                        .font(.system(size: isPad ? 30 : 18, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, isPad ? 20 : 12)
                                        .background(answerColor(ans))
                                        .cornerRadius(20)
                                        .scaleEffect(selectedAnswer == ans ? 1.05 : 1.0)
                                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: selectedAnswer)
                                }
                                .disabled(showAnswerResult)
                            }
                        }
                        .padding(.horizontal, isPad ? 40 : 20)
                    }
                    .transition(.opacity.combined(with: .scale))
                }
                
                Spacer()
            }
            .padding(.top, isPad ? 50 : 30)
        }
    }
    
    //  Score Box
    func playerScoreBox(player: String, score: Int) -> some View {
        VStack {
            Text(player)
                .font(.system(size: isPad ? 24 : 16, weight: .semibold))
                .foregroundColor(.white)
            Text("\(score)")
                .font(.system(size: isPad ? 36 : 24, weight: .bold))
                .foregroundColor(.black)
        }
        .frame(maxWidth: isPad ? 160 : 100)
        .padding(isPad ? 16 : 10)
        .background(Color.blue.opacity(0.25))
        .cornerRadius(20)
    }
    
    //  Answer Color
    func answerColor(_ answer: String) -> Color {
        if !showAnswerResult { return Color.orange }
        if answer == questions[questionIndex].correctAnswer { return Color.green }
        if answer == selectedAnswer { return Color.red }
        return Color.gray.opacity(0.5)
    }
    
    // Handle Answer Selection
    func selectAnswer(_ answer: String, correct: String) {
        selectedAnswer = answer
        showAnswerResult = true
        
        // Update score
        if answer == correct {
            scores[currentTurn] += 1
        }
        
        // Wait briefly then move to next question / turn
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            moveNext()
        }
    }
    
    func moveNext() {
        selectedAnswer = nil
        showAnswerResult = false
        
        if scores[0] == 2 {
            onFinish("Player 1")
            return
        }

        if scores[1] == 2 {
            onFinish("Player 2")
            return
        }
        
        // Switch turn
        currentTurn = 1 - currentTurn
        
        // Next question
        questionIndex += 1
        if questionIndex >= questions.count {
            // If all questions exhausted, pick highest score
            if scores[0] > scores[1] {
                onFinish("Player 1")
            } else if scores[1] > scores[0] {
                onFinish("Player 2")
            } else {
                onFinish(nil) // Tie again
            }
        }
    }
}





//**************

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
                    .foregroundColor(.black)
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
                            .foregroundColor(.red)
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

//struct TieBreakerIntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        TieBreakerIntroView {
//            print("Sudden Trivia Started!")
//        }
//    }
//}





// @@@@@@@@@@@@@@@@@@@@@
// HELP SCREEN
// @@@@@@@@@@@@@@@@@@@@@

struct InstructionCard: View {

    var title: String
    var icon: String
    var color: Color
    var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {

            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)

                Text(title)
                    .font(.title2.bold())
            }

            Text(text)
                .font(.body)
                .foregroundColor(.black.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.10), radius: 6, x: 0, y: 4)
        )
    }
}

//import SwiftUI

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
When playing One-Player mode, you’ll be competing against the trivia board!

• Begin with 20 tickets  
• Each incorrect answer deducts 2 tickets  
• Reach 0 tickets = you lose  
• Clear the board with tickets left = you win  
• Correct answers do not award tickets  

Answer carefully to secure victory!
"""
                )
                .foregroundStyle(Color.black)
                .bold()
                // Two Player Section
                InstructionCard(
                    title: "Two-Player Mode",
                    icon: "person.2.fill",
                    color: .green,
                    text: """
In Two-Player mode, you’ll compete against another player.

• Each player begins with 10 tickets  
• Players take turns answering questions  
• Incorrect answers deduct 1 ticket  
• Correct answers do not earn tickets  
• First player to reach 0 tickets loses  

If the board is cleared and scores are tied, Sudden Trivia begins!
"""
                )
                .foregroundStyle(Color.black)
                .bold()
                //  Sudden Trivia Section
                InstructionCard(
                    title: "Sudden Trivia Round",
                    icon: "bolt.fill",
                    color: .orange,
                    text: """
Sudden Trivia is a best-of-three showdown!

• Two players compete quickly  
• First player to win 2 out of 3 questions wins  
• Starting player is opposite from the previous game  

Fast, intense, and fun!
"""
                ).foregroundStyle(Color.black)
                    .bold()
            }
            .padding()
        }
        .background(Color.gray.opacity(0.10))
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
            launchConfetti()
        }
    }

    // Launch Confetti
    func launchConfetti() {

        particles.removeAll()

        let colors: [Color] = isCorrect
        ? [.green, .yellow, .orange, .blue, .purple]
        : [.gray, .red.opacity(0.8), .black.opacity(0.5)]

        for _ in 0..<(isCorrect ? 30 : 20) {

            let particle = ConfettiParticle(
                x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                y: -20,
                size: CGFloat.random(in: 8...14),
                rotation: Double.random(in: 0...360),
                color: colors.randomElement()!
            )

            particles.append(particle)
        }

        // Animate falling
        withAnimation(.easeOut(duration: 1.4)) {
            for i in particles.indices {
                particles[i].y = CGFloat.random(in: 700...1000)
                particles[i].rotation += Double.random(in: 200...500)
            }
        }

        // Remove after animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            particles.removeAll()
        }
    }
}



// @@@@@@@@@@@@@@@@@@@@@
// PREVIEW
// @@@@@@@@@@@@@@@@@@@@@

#Preview {
    StartGameView()
}


