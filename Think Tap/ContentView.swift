import SwiftUI




// @@@@@@@@@@@@@@@@@@@@@
// START SCREEN
// @@@@@@@@@@@@@@@@@@@@@

struct StartGameView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var path = NavigationPath() // back to this screen from win or lose screen
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
        
        NavigationStack(path: $path) {
            
            GeometryReader { geo in
                
              //  let width = geo.size.width
                
                let titleSize = isIPad ? 60.0 : 36.0
                let sectionTitleSize = isIPad ? 34.0 : 22.0
                let buttonFontSize = isIPad ? 26.0 : 18.0
                let horizontalPadding = isIPad ? 60.0 : 20.0
                
                let columns = [
                    GridItem(.adaptive(minimum: isIPad ? 260 : 150),
                             spacing: isIPad ? 30 : 20)
                ]
                
                ZStack {
                    
                    LinearGradient(colors: [Color.blue.opacity(0.25), Color(UIColor.systemBackground)],
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
                            .tapSound()
                            
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
                                       .foregroundColor(.primary)                                       .clipShape(RoundedRectangle(cornerRadius: 40))
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
                    startBoard: $startBoard,
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
        .background(isSelected ? Color.orange.opacity(0.9) :  Color(UIColor.secondarySystemBackground))
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
            .foregroundColor(.primary)
        }
        .padding()
        .frame(height: isIPad ? 220 : 160)
        .background(isSelected ? Color.orange.opacity(0.9) :  Color(UIColor.secondarySystemBackground))
        .cornerRadius(25)
        .shadow(radius: isSelected ? 10 : 5)
        .scaleEffect(isSelected ? 1.05 : 1)
    }
}









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
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(UIColor.secondarySystemBackground))
                .shadow(color: .black.opacity(0.10), radius: 6, x: 0, y: 4)
        )
    }
}

// @@@@@@@@@@@@@@@@@@@@@
// PREVIEW
// @@@@@@@@@@@@@@@@@@@@@

#Preview {
 StartGameView()
}


