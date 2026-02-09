import SwiftUI

// =======================================================
// MARK: - MODELS
// =======================================================

struct TriviaQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctAnswer: String
    var isAnswered: Bool = false
}



struct TriviaSubcategory: Identifiable {
    let id = UUID()
    let name: String
    var questions: [TriviaQuestion]
}

struct TriviaCategory: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    var subcategories: [TriviaSubcategory]
}

// =======================================================
// MARK: - FULL BOARD DATA (4x5x4)
// =======================================================

let fullBoardData: [TriviaCategory] = [

    // ------------------ Entertainment ------------------
    TriviaCategory(name: "Entertainment", imageName: "Entertainment", subcategories: [
        TriviaSubcategory(name: "Movies", questions: [
            TriviaQuestion(question: "Who played Iron Man?", options: ["Chris Evans", "Robert Downey Jr.", "Tom Holland", "Will Smith"], correctAnswer: "Robert Downey Jr."),
            TriviaQuestion(question: "Which movie won Best Picture in 2020?", options: ["Parasite", "Joker", "Titanic", "Avatar"], correctAnswer: "Parasite"),
            TriviaQuestion(question: "Which is a Disney movie?", options: ["Frozen", "Jaws", "Rocky", "Matrix"], correctAnswer: "Frozen"),
            TriviaQuestion(question: "What is Hulk's color?", options: ["Red", "Green", "Blue", "Black"], correctAnswer: "Green")
        ]),
        TriviaSubcategory(name: "Music", questions: [
            TriviaQuestion(question: "Which is a musical instrument?", options: ["Guitar", "Car", "Phone", "Bottle"], correctAnswer: "Guitar"),
            TriviaQuestion(question: "How many notes in music scale?", options: ["5", "6", "7", "10"], correctAnswer: "7"),
            TriviaQuestion(question: "Which is a pop star?", options: ["Taylor Swift", "Einstein", "Newton", "Tesla"], correctAnswer: "Taylor Swift"),
            TriviaQuestion(question: "Music is made of?", options: ["Sound", "Water", "Fire", "Stone"], correctAnswer: "Sound")
        ]),
        TriviaSubcategory(name: "TV Shows", questions: [
            TriviaQuestion(question: "Which is a Netflix show?", options: ["Stranger Things", "News", "Sports", "Cartoon"], correctAnswer: "Stranger Things"),
            TriviaQuestion(question: "TV stands for?", options: ["Television", "Telephone", "Telegram", "Taxi"], correctAnswer: "Television"),
            TriviaQuestion(question: "Which is a cartoon?", options: ["Tom & Jerry", "Titanic", "Batman", "Nile"], correctAnswer: "Tom & Jerry"),
            TriviaQuestion(question: "TV uses?", options: ["Screen", "Paper", "Wood", "Sand"], correctAnswer: "Screen")
        ]),
        TriviaSubcategory(name: "Actors", questions: [
            TriviaQuestion(question: "Actor in Pirates of Caribbean?", options: ["Johnny Depp", "Messi", "Ronaldo", "Eminem"], correctAnswer: "Johnny Depp"),
            TriviaQuestion(question: "Actor in Mission Impossible?", options: ["Tom Cruise", "Bill Gates", "Obama", "Drake"], correctAnswer: "Tom Cruise"),
            TriviaQuestion(question: "Which is an actor?", options: ["Brad Pitt", "Amazon", "Google", "Nile"], correctAnswer: "Brad Pitt"),
            TriviaQuestion(question: "Actors work in?", options: ["Movies", "Hospitals", "Farms", "Banks"], correctAnswer: "Movies")
        ]),
        TriviaSubcategory(name: "Games", questions: [
            TriviaQuestion(question: "Which is a video game?", options: ["Minecraft", "Pizza", "River", "School"], correctAnswer: "Minecraft"),
            TriviaQuestion(question: "Which is a console?", options: ["PlayStation", "Laptop", "Book", "Pen"], correctAnswer: "PlayStation"),
            TriviaQuestion(question: "Gaming uses?", options: ["Controller", "Spoon", "Shoes", "Brush"], correctAnswer: "Controller"),
            TriviaQuestion(question: "Famous plumber game?", options: ["Mario", "Batman", "Spiderman", "Hulk"], correctAnswer: "Mario")
        ])
    ]),

    // ------------------ Food & Drink ------------------
    TriviaCategory(name: "Food & Drink", imageName: "FoodDrink", subcategories: [
        TriviaSubcategory(name: "Fruits", questions: [
            TriviaQuestion(question: "Which is a fruit?", options: ["Apple", "Carrot", "Rice", "Bread"], correctAnswer: "Apple"),
            TriviaQuestion(question: "Banana color?", options: ["Yellow", "Blue", "Black", "Purple"], correctAnswer: "Yellow"),
            TriviaQuestion(question: "Fruit with seeds outside?", options: ["Strawberry", "Potato", "Onion", "Cheese"], correctAnswer: "Strawberry"),
            TriviaQuestion(question: "Orange is?", options: ["Fruit", "Car", "Animal", "Toy"], correctAnswer: "Fruit")
        ]),
        TriviaSubcategory(name: "Drinks", questions: [
            TriviaQuestion(question: "Which is a drink?", options: ["Water", "Rock", "Paper", "Fire"], correctAnswer: "Water"),
            TriviaQuestion(question: "Coffee contains?", options: ["Caffeine", "Sand", "Iron", "Plastic"], correctAnswer: "Caffeine"),
            TriviaQuestion(question: "Milk comes from?", options: ["Cow", "Tree", "Stone", "Fish"], correctAnswer: "Cow"),
            TriviaQuestion(question: "Juice is made from?", options: ["Fruits", "Cars", "Books", "Shoes"], correctAnswer: "Fruits")
        ]),
        TriviaSubcategory(name: "Fast Food", questions: [
            TriviaQuestion(question: "Burger is?", options: ["Fast Food", "Fruit", "Drink", "Animal"], correctAnswer: "Fast Food"),
            TriviaQuestion(question: "Pizza comes from?", options: ["Italy", "Japan", "Brazil", "India"], correctAnswer: "Italy"),
            TriviaQuestion(question: "French fries are made of?", options: ["Potatoes", "Apples", "Rice", "Fish"], correctAnswer: "Potatoes"),
            TriviaQuestion(question: "Hotdog is?", options: ["Snack", "Planet", "River", "Book"], correctAnswer: "Snack")
        ]),
        TriviaSubcategory(name: "Desserts", questions: [
            TriviaQuestion(question: "Ice cream is?", options: ["Dessert", "Soup", "Fruit", "Vegetable"], correctAnswer: "Dessert"),
            TriviaQuestion(question: "Cake is usually?", options: ["Sweet", "Salty", "Spicy", "Sour"], correctAnswer: "Sweet"),
            TriviaQuestion(question: "Chocolate comes from?", options: ["Cocoa", "Milk", "Rice", "Cheese"], correctAnswer: "Cocoa"),
            TriviaQuestion(question: "Cookie is?", options: ["Dessert", "Animal", "Car", "City"], correctAnswer: "Dessert")
        ]),
        TriviaSubcategory(name: "Healthy Food", questions: [
            TriviaQuestion(question: "Which is healthy?", options: ["Salad", "Candy", "Soda", "Burger"], correctAnswer: "Salad"),
            TriviaQuestion(question: "Vegetables contain?", options: ["Vitamins", "Plastic", "Smoke", "Sand"], correctAnswer: "Vitamins"),
            TriviaQuestion(question: "Water is?", options: ["Healthy", "Poison", "Metal", "Stone"], correctAnswer: "Healthy"),
            TriviaQuestion(question: "Best breakfast?", options: ["Oats", "Ice cream", "Pizza", "Candy"], correctAnswer: "Oats")
        ])
    ]),

    // ------------------ Geography ------------------
    TriviaCategory(name: "Geography", imageName: "geographic", subcategories: [
        TriviaSubcategory(name: "Countries", questions: [
            TriviaQuestion(question: "Capital of France?", options: ["Paris", "London", "Rome", "Berlin"], correctAnswer: "Paris"),
            TriviaQuestion(question: "Japan is in?", options: ["Asia", "Europe", "Africa", "Antarctica"], correctAnswer: "Asia"),
            TriviaQuestion(question: "Egypt is in?", options: ["Africa", "Asia", "Europe", "Australia"], correctAnswer: "Africa"),
            TriviaQuestion(question: "Longest river?", options: ["Nile", "Amazon", "Danube", "Ganges"], correctAnswer: "Nile")
        ]),
        TriviaSubcategory(name: "Rivers", questions: [
            TriviaQuestion(question: "Amazon is in?", options: ["Brazil", "Canada", "Japan", "India"], correctAnswer: "Brazil"),
            TriviaQuestion(question: "River flows to?", options: ["Sea", "Sky", "Mountain", "Desert"], correctAnswer: "Sea"),
            TriviaQuestion(question: "Nile flows in?", options: ["Africa", "Europe", "USA", "China"], correctAnswer: "Africa"),
            TriviaQuestion(question: "Mississippi is in?", options: ["USA", "China", "India", "Egypt"], correctAnswer: "USA")
        ]),
        TriviaSubcategory(name: "Mountains", questions: [
            TriviaQuestion(question: "Highest mountain?", options: ["Everest", "Alps", "Rocky", "Fuji"], correctAnswer: "Everest"),
            TriviaQuestion(question: "Everest is in?", options: ["Nepal", "France", "USA", "Egypt"], correctAnswer: "Nepal"),
            TriviaQuestion(question: "Mountains are?", options: ["High land", "Water", "Cities", "Animals"], correctAnswer: "High land"),
            TriviaQuestion(question: "Rocky mountains in?", options: ["USA", "India", "Japan", "Brazil"], correctAnswer: "USA")
        ]),
        TriviaSubcategory(name: "Deserts", questions: [
            TriviaQuestion(question: "Largest desert?", options: ["Antarctic", "Sahara", "Gobi", "Kalahari"], correctAnswer: "Antarctic"),
            TriviaQuestion(question: "Sahara is in?", options: ["Africa", "Europe", "Asia", "Australia"], correctAnswer: "Africa"),
            TriviaQuestion(question: "Deserts are?", options: ["Dry", "Wet", "Cold", "Green"], correctAnswer: "Dry"),
            TriviaQuestion(question: "Gobi desert is in?", options: ["Asia", "Africa", "USA", "Europe"], correctAnswer: "Asia")
        ]),
        TriviaSubcategory(name: "Oceans", questions: [
            TriviaQuestion(question: "Largest ocean?", options: ["Pacific", "Atlantic", "Indian", "Arctic"], correctAnswer: "Pacific"),
            TriviaQuestion(question: "Ocean is?", options: ["Salt water", "Sand", "Fire", "Stone"], correctAnswer: "Salt water"),
            TriviaQuestion(question: "Atlantic is?", options: ["Ocean", "Country", "River", "Mountain"], correctAnswer: "Ocean"),
            TriviaQuestion(question: "Arctic ocean is?", options: ["Cold", "Hot", "Dry", "Green"], correctAnswer: "Cold")
        ])
    ]),

    // ------------------ Facts ------------------
    TriviaCategory(name: "Facts", imageName: "useless", subcategories: [
        TriviaSubcategory(name: "Animals", questions: [
            TriviaQuestion(question: "Ship of desert?", options: ["Camel", "Horse", "Lion", "Dog"], correctAnswer: "Camel"),
            TriviaQuestion(question: "King of jungle?", options: ["Lion", "Cat", "Cow", "Fish"], correctAnswer: "Lion"),
            TriviaQuestion(question: "Largest animal?", options: ["Blue Whale", "Elephant", "Tiger", "Horse"], correctAnswer: "Blue Whale"),
            TriviaQuestion(question: "Fastest animal?", options: ["Cheetah", "Lion", "Dog", "Rabbit"], correctAnswer: "Cheetah")
        ]),
        TriviaSubcategory(name: "Science", questions: [
            TriviaQuestion(question: "Water formula?", options: ["H2O", "CO2", "O2", "NaCl"], correctAnswer: "H2O"),
            TriviaQuestion(question: "Sun is a?", options: ["Star", "Planet", "Moon", "River"], correctAnswer: "Star"),
            TriviaQuestion(question: "Humans breathe?", options: ["Oxygen", "Water", "Sand", "Fire"], correctAnswer: "Oxygen"),
            TriviaQuestion(question: "Earth is?", options: ["Planet", "Star", "Comet", "Galaxy"], correctAnswer: "Planet")
        ]),
        TriviaSubcategory(name: "Space", questions: [
            TriviaQuestion(question: "Closest planet to Sun?", options: ["Mercury", "Mars", "Earth", "Jupiter"], correctAnswer: "Mercury"),
            TriviaQuestion(question: "Moon orbits?", options: ["Earth", "Sun", "Mars", "Venus"], correctAnswer: "Earth"),
            TriviaQuestion(question: "Galaxy name?", options: ["Milky Way", "Blue Sky", "Sun Road", "Moon Path"], correctAnswer: "Milky Way"),
            TriviaQuestion(question: "Mars is called?", options: ["Red Planet", "Blue Planet", "Green Planet", "Yellow Planet"], correctAnswer: "Red Planet")
        ]),
        TriviaSubcategory(name: "History", questions: [
            TriviaQuestion(question: "Pyramids are in?", options: ["Egypt", "USA", "France", "China"], correctAnswer: "Egypt"),
            TriviaQuestion(question: "Roman Empire was in?", options: ["Europe", "Australia", "Antarctica", "Ocean"], correctAnswer: "Europe"),
            TriviaQuestion(question: "First president USA?", options: ["George Washington", "Lincoln", "Obama", "Trump"], correctAnswer: "George Washington"),
            TriviaQuestion(question: "Great Wall is in?", options: ["China", "India", "Brazil", "Italy"], correctAnswer: "China")
        ]),
        TriviaSubcategory(name: "General", questions: [
            TriviaQuestion(question: "How many continents?", options: ["7", "5", "6", "8"], correctAnswer: "7"),
            TriviaQuestion(question: "Largest planet?", options: ["Jupiter", "Earth", "Mars", "Venus"], correctAnswer: "Jupiter"),
            TriviaQuestion(question: "Fastest transport?", options: ["Airplane", "Car", "Bike", "Boat"], correctAnswer: "Airplane"),
            TriviaQuestion(question: "Opposite of hot?", options: ["Cold", "Warm", "Fire", "Sun"], correctAnswer: "Cold")
        ])
    ])]

//    // ------------------ SUDDEN TRIVIA QUESTIONS ------------------
//    TriviaCategory(name: "SUDDEN ", imageName: "useless", subcategories: [
//        TriviaSubcategory(name: "Animals", questions: [
//            TriviaQuestion(question: "Ship of desert?", options: ["Camel", "Horse", "Lion", "Dog"], correctAnswer: "Camel"),
//            TriviaQuestion(question: "King of jungle?", options: ["Lion", "Cat", "Cow", "Fish"], correctAnswer: "Lion"),
//            TriviaQuestion(question: "Largest animal?", options: ["Blue Whale", "Elephant", "Tiger", "Horse"], correctAnswer: "Blue Whale"),
//            TriviaQuestion(question: "Fastest animal?", options: ["Cheetah", "Lion", "Dog", "Rabbit"], correctAnswer: "Cheetah")
//        ]),
//        TriviaSubcategory(name: "Science", questions: [
//            TriviaQuestion(question: "Water formula?", options: ["H2O", "CO2", "O2", "NaCl"], correctAnswer: "H2O"),
//            TriviaQuestion(question: "Sun is a?", options: ["Star", "Planet", "Moon", "River"], correctAnswer: "Star"),
//            TriviaQuestion(question: "Humans breathe?", options: ["Oxygen", "Water", "Sand", "Fire"], correctAnswer: "Oxygen"),
//            TriviaQuestion(question: "Earth is?", options: ["Planet", "Star", "Comet", "Galaxy"], correctAnswer: "Planet")
//        ]),
//        TriviaSubcategory(name: "Space", questions: [
//            TriviaQuestion(question: "Closest planet to Sun?", options: ["Mercury", "Mars", "Earth", "Jupiter"], correctAnswer: "Mercury"),
//            TriviaQuestion(question: "Moon orbits?", options: ["Earth", "Sun", "Mars", "Venus"], correctAnswer: "Earth"),
//            TriviaQuestion(question: "Galaxy name?", options: ["Milky Way", "Blue Sky", "Sun Road", "Moon Path"], correctAnswer: "Milky Way"),
//            TriviaQuestion(question: "Mars is called?", options: ["Red Planet", "Blue Planet", "Green Planet", "Yellow Planet"], correctAnswer: "Red Planet")
//        ]),
//        TriviaSubcategory(name: "History", questions: [
//            TriviaQuestion(question: "Pyramids are in?", options: ["Egypt", "USA", "France", "China"], correctAnswer: "Egypt"),
//            TriviaQuestion(question: "Roman Empire was in?", options: ["Europe", "Australia", "Antarctica", "Ocean"], correctAnswer: "Europe"),
//            TriviaQuestion(question: "First president USA?", options: ["George Washington", "Lincoln", "Obama", "Trump"], correctAnswer: "George Washington"),
//            TriviaQuestion(question: "Great Wall is in?", options: ["China", "India", "Brazil", "Italy"], correctAnswer: "China")
//        ]),
//        TriviaSubcategory(name: "General", questions: [
//            TriviaQuestion(question: "How many continents?", options: ["7", "5", "6", "8"], correctAnswer: "7"),
//            TriviaQuestion(question: "Largest planet?", options: ["Jupiter", "Earth", "Mars", "Venus"], correctAnswer: "Jupiter"),
//            TriviaQuestion(question: "Fastest transport?", options: ["Airplane", "Car", "Bike", "Boat"], correctAnswer: "Airplane"),
//            TriviaQuestion(question: "Opposite of hot?", options: ["Cold", "Warm", "Fire", "Sun"], correctAnswer: "Cold")
//        ])
//    ])
//]

// @@@@@@@@@@@@@@@@@@@@@
// SUDDEN TRIVIA QUESTIONS
// @@@@@@@@@@@@@@@@@@@@@

//let suddenTriviaQuestions: [TriviaQuestion] = [
//    TriviaQuestion(question: "What planet is known as the Red Planet?", options: ["Mars","Venus","Earth","Jupiter"], correctAnswer: "Mars"),
//    TriviaQuestion(question: "Which ocean is the largest?", options: ["Pacific","Atlantic","Indian","Arctic"], correctAnswer: "Pacific"),
//    TriviaQuestion(question: "Who painted the Mona Lisa?", options: ["Leonardo da Vinci","Van Gogh","Picasso","Rembrandt"], correctAnswer: "Leonardo da Vinci")
//]

// @@@@@@@@@@@@@@@@@@@@@
// START SCREEN
// @@@@@@@@@@@@@@@@@@@@@

struct StartGameView: View {

    @State private var players = 1
    @State private var selectedCategory: TriviaCategory? = nil
    @State private var startBoard = false

    //  2 Columns 
    let columns = [
        GridItem(.flexible(), spacing: 25),
        GridItem(.flexible(), spacing: 25)
    ]

    var body: some View {
        NavigationStack {
            ZStack {

                Color.blue.opacity(0.20)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 10) {

                    //  Help Button
                    HStack {
                        Spacer()
                        NavigationLink {
                            GameInstructionsView()
                        } label: {
                            Image(systemName: "questionmark.circle.fill")
                                .font(.system(size: 50, weight: .bold))
                                .foregroundColor(.white)
                                .padding(14)
                                .background(Color.blue.opacity(0.15))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 20)

                    HStack{
                        Image("title1")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Text(" Think Tap")
                            .font(.system(size: 60, weight: .heavy))
                            .foregroundColor(.black.opacity(0.80))
                    }
                           // .padding()
                        
                    //  Player Selection
                    VStack(spacing: 40) {
                        
                        Text("Choose Players")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.black.opacity(0.80))

                        HStack(spacing: 20) {

                            // 1 Player Button
                            Button {
                                withAnimation(.spring()) {
                                    players = 1
                                }
                            } label: {
                                PlayerCard(
                                    title: "1 Player",
                                    icon: "person.fill",
                                    isSelected: players == 1
                                ).font(Font.system(size: 25, weight: .bold))
                                    .foregroundStyle(Color.black.opacity(0.7))
                            }

                            // 2 Player Button
                            Button {
                                withAnimation(.spring()) {
                                    players = 2
                                }
                            } label: {
//                                PlayerCard(
//                                    title: "2 Players",
//                                    icon: "person.2.fill",
//                                    isSelected: players == 2
     //                           )
                            }
                        }
                    }
                    .padding()
                    //Spacer()
                    //  Category Section
                    Text("Choose Category")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)

                    //  Categories
                    LazyVGrid(columns: columns, spacing: 40) {
                        ForEach(fullBoardData) { category in
                            Button {
                                withAnimation(.spring()) {
                                    selectedCategory = category
                                }
                            } label: {
                                CategoryCard(
                                    category: category,
                                    isSelected: selectedCategory?.id == category.id
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 60)

                    //  Start Button
                    Button {
                        startBoard = true
                    } label: {
                        Text(" Start Game")
                            .font(.system(size: 26, weight: .bold))
                            .frame(width: 420)
                            .padding(.vertical, 18)
                            .background(
                                selectedCategory == nil
                                ? Color.white.opacity(0.7)
                                : Color.orange
                            )
                            .foregroundColor(.black)
                            .cornerRadius(30)
                            .shadow(radius: 8)
                    }
                    .disabled(selectedCategory == nil)
                    .padding(.top, 10)

                    Spacer()
                }
            }

            //  Navigation Destination
            .navigationDestination(isPresented: $startBoard) {
                TriviaBoardView(
                    category: selectedCategory ?? fullBoardData[0],
                    isTwoPlayer: players == 2
                )
            }
        }
    }
}






// Player Card Component
struct PlayerCard: View {
   
    let title: String
    let icon: String
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 12) {

            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(.blue)

            Text(title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.black)
                .bold()
        }
        .padding()
        .frame(width: 200, height: 90)

        .background(
            isSelected
            ? Color.orange.opacity(0.9)
            : Color.white.opacity(0.7)
        )
        .cornerRadius(20)

        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isSelected ? Color.white : Color.clear, lineWidth: 2)
        )

        .shadow(radius: isSelected ? 8 : 4)
        .scaleEffect(isSelected ? 1.05 : 1)
    }
}






// Category Card Component
struct CategoryCard: View {

    let category: TriviaCategory
    let isSelected: Bool

    var body: some View {

        VStack(spacing: 16) {

            //  Category Image
            Image(category.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 130)
                .background(Color.black.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(radius: 6)

            // Category Name
            Text(category.name)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)
        }
        .padding()
        .frame(height: 220)
        .frame(width: 400)
        
//        .frame(maxWidth: .infinity)

        //  Card Background
        .background(
            isSelected
            ? Color.orange.opacity(0.7)
            : Color.white.opacity(0.7)
        )
        .cornerRadius(50)

        // Border Highlight
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(isSelected ? Color.white : Color.clear, lineWidth: 3)
        )

        .shadow(radius: isSelected ? 10 : 5)
        .scaleEffect(isSelected ? 1.05 : 1)
    }
}





struct TriviaBoardView: View {
    
    
    @State var category: TriviaCategory
    var isTwoPlayer: Bool

    @State private var ticketsP1 = 20
    @State private var ticketsP2 = 20
    @State private var currentTurn = 0

    // FIX: Only selectedQuestion is needed
    @State private var selectedQuestion: TriviaQuestion? = nil
    @State private var selectedSubcategoryName: String = ""

    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var showWinningScreen = false
    @State private var winnerName: String? = nil
    @State private var showLoseScreen = false
    
    // For Sudden Trivia
    @State private var showSuddenTrivia = false
    @State private var suddenTriviaIndex = 0
    @State private var suddenTriviaScores = [0, 0]

    var body: some View {

        ZStack {

            Color.blue.opacity(0.20)
                .ignoresSafeArea()

            VStack(spacing: 20) {

                // Category Title
                Text(category.name)
                    .font(.system(size: 42, weight: .heavy))
                    .padding(.top, 20)

                scoreboardCard()

                Divider()

                // Trivia Board
                ScrollView {

                    VStack(spacing: 25) {

                        // Subcategory Titles
                        LazyVGrid(
                            columns: Array(
                                repeating: GridItem(.flexible(), spacing: 12),
                                count: category.subcategories.count
                            ),
                            spacing: 12
                        ) {
                            ForEach(category.subcategories.indices, id: \.self) { subIndex in
                                Text(category.subcategories[subIndex].name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(.black.opacity(0.25))
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)

                        // Question Grid (4 rows)
                        ForEach(0..<4, id: \.self) { questionRow in

                            LazyVGrid(
                                columns: Array(
                                    repeating: GridItem(.flexible(), spacing: 12),
                                    count: category.subcategories.count
                                ),
                                spacing: 12
                            ) {

                                ForEach(category.subcategories.indices, id: \.self) { subIndex in

                                    let q = category.subcategories[subIndex]
                                        .questions[questionRow]

                                    Button {

                                        //  FIX: Set subcategory first
                                        selectedSubcategoryName =
                                            category.subcategories[subIndex].name

                                        //  FIX: Trigger fullScreenCover(item:)
                                        selectedQuestion = q

                                    } label: {

                                        Text("Q\(questionRow + 1)")
                                            .font(.system(size: 20, weight: .bold))
                                            .frame(height: 65)
                                            .frame(maxWidth: .infinity)
                                            .background(
                                                q.isAnswered
                                                ? Color.gray.opacity(0.6)
                                                : Color.orange.opacity(0.9)
                                            )
                                            .foregroundColor(.white)
                                            .cornerRadius(15)
                                    }
                                    .disabled(q.isAnswered)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
        }
        .onAppear {

            if isTwoPlayer {
                ticketsP1 = 10
                ticketsP2 = 10
            } else {
                ticketsP1 = 20
            }
        }

        // FIXED Question Screen
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
            LosingView(
                categoryName: category.name,
                categoryImage: category.imageName
            )
        }
        .fullScreenCover(isPresented: $showSuddenTrivia) {
            SuddenTriviaView(
                scores: $suddenTriviaScores,
                currentTurn: .constant(0),
                questionIndex: $suddenTriviaIndex,
                questions: suddenTriviaQuestionsFromBoard(), // pass questions from board
                onFinish: { winner in
                    winnerName = winner
                    showWinningScreen = true
                    showSuddenTrivia = false
                }
            )
        }
        
        



        // Alert
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK") { }
        }
    }

    // Scoreboard Card

    func scoreboardCard() -> some View {

        VStack(spacing: 12) {

            if isTwoPlayer {

                Text("Turn: Player \(currentTurn + 1)")
                    .font(.title2.bold())
                    .foregroundColor(.yellow)

                HStack {
                    scoreBox(title: "Player 1", value: ticketsP1, color: .green)
                    scoreBox(title: "Player 2", value: ticketsP2, color: .red)
                }

            } else {

                Text("Tickets Remaining")
                    .font(.headline)

                Text("\(ticketsP1)")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(.yellow)
            }
        }
        .padding()
        .frame(maxWidth: 600)
        .background(.white.opacity(0.15))
        .cornerRadius(25)
    }

    func scoreBox(title: String, value: Int, color: Color) -> some View {

        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)

            Text("\(value)")
                .font(.title.bold())
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.black.opacity(0.25))
        .cornerRadius(18)
    }
    // MARK: - Check If All Questions Are Answered
    func allQuestionsAnswered() -> Bool {

        for sub in category.subcategories {
            for q in sub.questions {
                if q.isAnswered == false {
                    return false
                }
            }
        }

        return true
    }
//Sudden trivia
    func suddenTriviaQuestionsFromBoard() -> [TriviaQuestion] {
        var questions: [TriviaQuestion] = []
        for sub in category.subcategories {
            for q in sub.questions {
                // Reset isAnswered for Sudden Trivia
                var newQ = q
                newQ.isAnswered = false
                questions.append(newQ)
            }
        }
        return questions.shuffled()
    }
    // MARK: Game Over Check

    func checkGameOver() {

        // =========================================
        // Losing Condition (Tickets Reach 0)
        // =========================================

        if !isTwoPlayer {
            // One Player loses if tickets hit 0
            if ticketsP1 <= 0 {
                showLoseScreen = true
                return
            }
        }

        if isTwoPlayer {
            // Player 1 loses → Player 2 wins
            if ticketsP1 <= 0 {
                winnerName = "Player 2"
                showWinningScreen = true
                return
            }

            // Player 2 loses → Player 1 wins
            if ticketsP2 <= 0 {
                winnerName = "Player 1"
                showWinningScreen = true
                return
            }
        }

        // =========================================
        //  Winning Condition-Board
        // =========================================

        // Winning Condition (Board Completed)
        if allQuestionsAnswered() {
            if isTwoPlayer {
                if ticketsP1 > ticketsP2 {
                    winnerName = "Player 1"
                    showWinningScreen = true
                } else if ticketsP2 > ticketsP1 {
                    winnerName = "Player 2"
                    showWinningScreen = true
                } else {
                    // Tie → Start Sudden Trivia
                    suddenTriviaScores = [0, 0]
                    suddenTriviaIndex = 0
                    showSuddenTrivia = true
                }
                return
            }
            
            // One Player
            if ticketsP1 > 0 {
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
    @State private var timer: Timer? = nil

    // Popup Overlay
    @State private var showResult = false
    @State private var isCorrect = false
    @State private var popupMessage = ""

    // Track selected answer
    @State private var selectedAnswer: String? = nil

    //  Animations
    @State private var correctPulse = false
    @State private var wrongShake: CGFloat = 0

    var body: some View {

        ZStack {

            Color.blue.opacity(0.20)
                .ignoresSafeArea()

            VStack(spacing: 25) {

                // Top Info
                VStack(spacing: 8) {
                    Text("Subcategory: \(subcategoryName)")
                        .font(.headline)

                    if isTwoPlayer {
                        Text("Player Turn: \(currentTurn + 1)")
                            .font(.title2.bold())
                            .foregroundColor(.yellow)
                    }

                    Text(" Time Remaining: \(timeRemaining)s")
                        .font(.headline)
                        .foregroundColor(.red)

                    HStack {
                        Text("P1: \(ticketsP1) ")
                        if isTwoPlayer {
                            Text("P2: \(ticketsP2) ")
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.black.opacity(0.25))
                .cornerRadius(18)

                Spacer()

                // Question
                Text(question.question)
                    .font(.system(size: 26, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(.white.opacity(0.25))
                    .cornerRadius(20)

                // Answers
                HStack(spacing: 12) {
                    ForEach(question.options, id: \.self) { option in

                        Button {
                            stopTimer()
                            selectedAnswer = option
                            handleAnswer(option)
                        } label: {
                            Text(option)
                                .frame(width: 120, height: 55)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .background(buttonColor(for: option))
                                // ✅ Animations
                                .scaleEffect(buttonScale(for: option))
                                .offset(x: buttonOffset(for: option))
                        }
                        .disabled(showResult)
                        .animation(.spring(), value: correctPulse)
                        .animation(.default, value: wrongShake)
                    }
                }

                Spacer()

                // Back Button
                Button {
                    stopTimer()
                    dismiss()
                } label: {
                    Label("Back to Board", systemImage: "arrow.left.circle.fill")
                        .font(.title3.bold())
                        .padding()
                        .frame(maxWidth: 250)
                        .background(.black.opacity(0.30))
                        .foregroundColor(.white)
                        .cornerRadius(18)
                }

                Spacer()
            }
            .padding()

            // Overlay Popup
            if showResult {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)

                VStack(spacing: 20) {

                    Text(isCorrect ? " Correct!" : "❌ Wrong!")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .padding()
                        .background(isCorrect ? Color.green : Color.red)
                        .cornerRadius(20)

                    Text(popupMessage)
                        .multilineTextAlignment(.center)
                        .font(.title3.bold())
                        .foregroundColor(.white)

                }
                .padding()
                .frame(maxWidth: 350)
                .background(Color.black.opacity(0.7))
                .cornerRadius(25)
                .shadow(radius: 10)
                .transition(.scale)
            }
        }
        .onAppear { startTimer() }
        .onDisappear { stopTimer() }
    }

    // MARK: Timer
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
                selectedAnswer = ""
                handleAnswer("")
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    // MARK: Answer Handling
    func handleAnswer(_ answer: String) {

        isCorrect = (answer == question.correctAnswer)

        if !isCorrect {
            if isTwoPlayer {
                if currentTurn == 0 { ticketsP1 -= 1 }
                else { ticketsP2 -= 1 }
                currentTurn = currentTurn == 0 ? 1 : 0
            } else {
                ticketsP1 -= 2
            }
        }

        // Mark Question Answered
        markAnswered()

        // Update Score / Game Over
        onAnswer()

        // Popup message
        popupMessage = """
Correct Answer: \(question.correctAnswer)
Player 1: \(ticketsP1) 
"""
        if isTwoPlayer {
            popupMessage += "\nPlayer 2: \(ticketsP2) "
        }

        // Show Overlay
        withAnimation(.spring()) {
            showResult = true
        }

        // Trigger Animations
        if isCorrect {
            correctPulse.toggle()
        } else {
            withAnimation(Animation.default.repeatCount(4, autoreverses: true)) {
                wrongShake = 10
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    wrongShake = 0
                }
            }
        }

        // Auto dismiss after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            dismiss()
        }
    }

    // Button Colors
    func buttonColor(for option: String) -> Color {
        if !showResult && selectedAnswer == nil { return Color.orange }
        if option == question.correctAnswer { return Color.green }
        if option == selectedAnswer && selectedAnswer != question.correctAnswer { return Color.red }
        return Color.orange.opacity(0.7)
    }

    //  Button Animations
    func buttonScale(for option: String) -> CGFloat {
        if isCorrect && option == question.correctAnswer && showResult { return correctPulse ? 1.1 : 1.0 }
        return 1.0
    }

    func buttonOffset(for option: String) -> CGFloat {
        if !isCorrect && option == selectedAnswer && showResult { return wrongShake }
        return 0
    }

    //  Question Answered
    func markAnswered() {
        for subIndex in category.subcategories.indices {
            for qIndex in category.subcategories[subIndex].questions.indices {
                if category.subcategories[subIndex].questions[qIndex].id == question.id {
                    category.subcategories[subIndex].questions[qIndex].isAnswered = true
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

    var body: some View {

        ZStack {

            Color.blue.opacity(0.95)
                .ignoresSafeArea()

            VStack(spacing: 25) {

                
                Text(" Congratulations!")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                
                Text("You won the board!")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.9))

                //  Winner Name (Only for 2 players)
                if let winner = winnerName {
                    Text("Winner: \(winner)")
                        .font(.title2.bold())
                        .foregroundColor(.yellow)
                }

                //  Line 3 Category Image + Name
                VStack(spacing: 12) {

                    Image(categoryImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 140)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(radius: 10)

                    Text(categoryName)
                        .font(.title.bold())
                        .foregroundColor(.white)
                }

                Divider()
                    .background(Color.white)

                //  Line 4 Final Tickets
                Text("Final Tickets: \(finalTickets)")
                    .font(.title.bold())
                    .foregroundColor(.white)

                Spacer()

                //  End Button
                Button {
                    dismiss()
                    dismiss()
                } label: {
                    Text("Back to topic categories")
                        .font(.headline.bold())
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 8)
                }
                .padding(.horizontal, 30)
            }
            .padding(.top, 70)
        }
    }
}

//LOSING SCREEN
struct LosingView: View {

    var categoryName: String
    var categoryImage: String

    @Environment(\.dismiss) var dismiss

    var body: some View {

        ZStack {

            Color.red.opacity(0.95)
                .ignoresSafeArea()

            VStack(spacing: 25) {

                Text(" Game Over!")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                Text("Your tickets reached 0")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.9))

                VStack(spacing: 12) {

                    Image(categoryImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 140)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(radius: 10)

                    Text(categoryName)
                        .font(.title.bold())
                        .foregroundColor(.white)
                }

                Spacer()

                Button {
                    dismiss()
                    dismiss()
                } label: {
                    Text("Back to topic categories")
                        .font(.headline.bold())
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 8)
                }
                .padding(.horizontal, 30)
            }
            .padding(.top, 70)
        }
    }
}






// @@@@@@@@@@@@@@@@@@@@@
// SUDDEN TRIVIA VIEW
// @@@@@@@@@@@@@@@@@@@@@

struct SuddenTriviaView: View {

    @Binding var scores: [Int]         // [Player1Score, Player2Score]
    @Binding var currentTurn: Int      // whose turn
    @Binding var questionIndex: Int    // current question
    var questions: [TriviaQuestion]    // questions passed from board

    var onFinish: (String) -> Void     // called when sudden trivia ends

    @Environment(\.dismiss) var dismiss

    @State private var timeLeft = 15
    @State private var timerRunning = true

    var currentQuestion: TriviaQuestion? {
        guard questionIndex < questions.count else { return nil }
        return questions[questionIndex]
    }

    var body: some View {
        VStack(spacing: 20) {
            if let q = currentQuestion {
                Text("⚡ Sudden Trivia!")
                    .font(.title)
                    .bold()

                Text("Player \(currentTurn + 1)'s Turn")
                    .font(.title2)

                Text(q.question)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()

                Text("⏱ \(timeLeft)s")
                    .font(.title2)
                    .foregroundColor(timeLeft <= 5 ? .red : .primary)
                    .bold()

                ForEach(q.options.shuffled(), id: \.self) { option in
                    Button(option) {
                        answerSelected(option, question: q)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!timerRunning)
                }

            } else {
                // All questions done → determine winner
                EmptyView()
                    .onAppear {
                        determineWinner()
                    }
            }
        }
        .padding()
        .onAppear(perform: startTimer)
    }

    // MARK: Timer
    func startTimer() {
        timeLeft = 15
        timerRunning = true

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            guard timerRunning else {
                timer.invalidate()
                return
            }

            if timeLeft > 0 {
                timeLeft -= 1
            } else {
                timer.invalidate()
                timerRunning = false
                nextQuestion()
            }
        }
    }

    // MARK: Answer Handling
    func answerSelected(_ answer: String, question: TriviaQuestion) {
        timerRunning = false
        if answer == question.correctAnswer {
            scores[currentTurn] += 1
        }
        nextQuestion()
    }

    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            currentTurn = currentTurn == 0 ? 1 : 0
            startTimer() // restart timer
        }
    }

    // MARK: Determine Winner
    func determineWinner() {
        let winner: String
        if scores[0] > scores[1] { winner = "Player 1" }
        else if scores[1] > scores[0] { winner = "Player 2" }
        else { winner = "It's a Tie!" }

        DispatchQueue.main.async {
            onFinish(winner)
        }
    }
}

// @@@@@@@@@@@@@@@@@@@@@
// HELP SCREEN
// @@@@@@@@@@@@@@@@@@@@@

struct GameInstructionsView: View {
    var body: some View {
        ZStack {
            
            Color.gray.opacity(0.10)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 15) {
                Text("One-Player Info")
                    .font(.largeTitle)
                    .bold()
                
                Text("""
When playing One-Player mode, you’ll be competing against the trivia board! Begin with 20 tickets. Each incorrect answer deducts 2 tickets until you reach 0 tickets or clear the board, whichever happens first. If you reach 0 tickets, you’ve lost the game! If you have tickets left, you’ve won! No tickets are awarded for correct answers. Answer each question on the board carefully to secure victory!
""").font(.title2).bold()
                
                
                Divider()
                    .padding()
                Text("Two-Player Info")
                    .font(.largeTitle)
                    .bold()
                Text("""
When playing Two-Player mode, you’ll be competing against the trivia board and another player. Each player begins with 10 tickets. The players are to decide who chooses the category to play. The player who didn’t select the category chooses the first question to start the game. Players take turns answering questions. Each incorrect answer deducts 1 ticket from the player, while correct answers don’t earn any tickets. The game continues until one player has no tickets. This ends the game, and the player with no tickets loses. If the board is cleared and both players have points, the player with the most points wins. If the score is tied, the Sudden Trivia round begins. 
""").font(.title2).bold()
                Divider()
                    .padding()
                Text("Sudden Trivia Info")
                    .font(.largeTitle)
                    .bold()
                
                Text("""
In Sudden Trivia, two players compete in a quick best-of-three trivia game. The player who starts the game and chooses the category is the opposite player from the previous game. The first player to win two out of three trivia games is declared the winner.

""").font(.title2).bold()
            }
            //        .padding()
            .navigationTitle("Help")
            .font(.largeTitle)
            .foregroundColor(.black)
            .bold()
        }
    }
}
// @@@@@@@@@@@@@@@@@@@@@
// PREVIEW
// @@@@@@@@@@@@@@@@@@@@@

#Preview {
    StartGameView()
}
