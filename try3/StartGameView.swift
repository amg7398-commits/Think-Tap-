////
////  StartGameView.swift
////  try3
////
////  Created by Hussein Alzailaei on 2/5/26.
////
//
//
//struct StartGameView: View {
//
//    @State private var players = 1
//    @State private var selectedCategory: TriviaCategory? = nil
//    @State private var startBoard = false
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//
//                // 🌈 Background Gradient
//                LinearGradient(
//                    colors: [Color.purple, Color.blue.opacity(0.8)],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//                .ignoresSafeArea()
//
//                VStack(spacing: 25) {
//
//                    // ❓ Help Button Top Right
//                    HStack {
//                        Spacer()
//                        NavigationLink {
//                            GameInstructionsView()
//                        } label: {
//                            Image(systemName: "questionmark.circle.fill")
//                                .font(.system(size: 28))
//                                .foregroundColor(.white)
//                                .padding(10)
//                                .background(Color.white.opacity(0.2))
//                                .clipShape(Circle())
//                        }
//                    }
//                    .padding(.horizontal)
//                    .padding(.top, 15)
//
//                    // 🎯 Game Title
//                    VStack(spacing: 8) {
//                        Text("🎯 Trivia Challenge")
//                            .font(.system(size: 38, weight: .heavy))
//                            .foregroundColor(.white)
//
//                        Text("Pick a category and start playing!")
//                            .font(.headline)
//                            .foregroundColor(.white.opacity(0.85))
//                    }
//
//                    // 👥 Player Picker
//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("Players")
//                            .font(.headline)
//                            .foregroundColor(.white.opacity(0.9))
//
//                        Picker("Players", selection: $players) {
//                            Text("1 Player").tag(1)
//                            Text("2 Players").tag(2)
//                        }
//                        .pickerStyle(.segmented)
//                    }
//                    .padding(.horizontal)
//
//                    // 📌 Category Section
//                    Text("Choose Category")
//                        .font(.system(size: 22, weight: .bold))
//                        .foregroundColor(.white)
//                        .padding(.top, 5)
//
//                    // 🎴 Category Grid
//                    ScrollView(showsIndicators: false) {
//                        LazyVGrid(
//                            columns: [
//                                GridItem(.flexible(), spacing: 18),
//                                GridItem(.flexible(), spacing: 18)
//                            ],
//                            spacing: 18
//                        ) {
//
//                            ForEach(fullBoardData) { category in
//                                CategoryCard(
//                                    category: category,
//                                    isSelected: selectedCategory?.id == category.id
//                                )
//                                .onTapGesture {
//                                    withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
//                                        selectedCategory = category
//                                    }
//                                }
//                            }
//                        }
//                        .padding(.horizontal)
//                        .padding(.bottom, 20)
//                    }
//
//                    // ▶ Start Button
//                    Button {
//                        startBoard = true
//                    } label: {
//                        Text("▶ Start Game")
//                            .font(.system(size: 22, weight: .bold))
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(
//                                selectedCategory == nil
//                                ? Color.gray.opacity(0.5)
//                                : Color.orange
//                            )
//                            .foregroundColor(.white)
//                            .cornerRadius(20)
//                            .shadow(radius: 6)
//                    }
//                    .disabled(selectedCategory == nil)
//                    .padding(.horizontal)
//
//                    Spacer()
//                }
//            }
//
//            // 🚀 Navigate to Board Screen
//            .navigationDestination(isPresented: $startBoard) {
//                TriviaBoardView(
//                    category: selectedCategory ?? fullBoardData[0],
//                    isTwoPlayer: players == 2
//                )
//            }
//        }
//    }
//}
