//
//  CategoryData.swift
//  try3
//
//  Created by Hussein Alzailaei on 2/4/26.
//


//let categories: [Category] = [
//
//    // ENTERTAINMENT
//    Category(
//        title: "Entertainment",
//        imageName: "entertainment",
//        subcategories: [
//            Subcategory(title: "Movies", questions: [
//                Question(label: "Q1", text: "Who directed Titanic?",
//                         answers: ["James Cameron", "Spielberg", "Nolan", "Scorsese"], correctIndex: 0),
//                Question(label: "Q2", text: "Which movie features Forrest Gump?",
//                         answers: ["Forrest Gump", "Cast Away", "Titanic", "Rocky"], correctIndex: 0),
//                Question(label: "Q3", text: "What year was Avatar released?",
//                         answers: ["2007", "2009", "2011", "2013"], correctIndex: 1),
//                Question(label: "Q4", text: "Best Picture winner 2020?",
//                         answers: ["Parasite", "1917", "Joker", "Ford v Ferrari"], correctIndex: 0)
//            ]),
//            Subcategory(title: "Music", questions: [
//                Question(label: "Q1", text: "Who is the King of Pop?",
//                         answers: ["Elvis", "Prince", "Michael Jackson", "Drake"], correctIndex: 2),
//                Question(label: "Q2", text: "Which instrument has 88 keys?",
//                         answers: ["Piano", "Guitar", "Violin", "Drums"], correctIndex: 0),
//                Question(label: "Q3", text: "Who sang Shape of You?",
//                         answers: ["Ed Sheeran", "Justin Bieber", "Adele", "Bruno Mars"], correctIndex: 0),
//                Question(label: "Q4", text: "Bohemian Rhapsody band?",
//                         answers: ["Queen", "Beatles", "U2", "Coldplay"], correctIndex: 0)
//            ]),
//            // Add the rest: TV Shows, Video Games, Celebrities
//        ]
//    ),
//
//    // USELESS FACTS
//    Category(
//        title: "Useless Facts",
//        imageName: "useless",
//        subcategories: [
//            Subcategory(title: "Random", questions: [
//                Question(label: "Q1", text: "Original Coca-Cola color?",
//                         answers: ["Clear", "Green", "Brown", "Black"], correctIndex: 0),
//                Question(label: "Q2", text: "Animal that never sleeps?",
//                         answers: ["Bullfrog", "Shark", "Ant", "Dolphin"], correctIndex: 0),
//                Question(label: "Q3", text: "How many hearts does an octopus have?",
//                         answers: ["1", "2", "3", "4"], correctIndex: 2),
//                Question(label: "Q4", text: "Do bananas float?",
//                         answers: ["Yes", "No", "Only ripe", "Only green"], correctIndex: 0)
//            ])
//            // Add Science, Animals, Human Body, History
//        ]
//    ),
//
//    // FOOD & DRINK
//    Category(
//        title: "Food & Drink",
//        imageName: "food",
//        subcategories: [
//            Subcategory(title: "Fruits", questions: [
//                Question(label: "Q1", text: "Strawberries have seeds on outside?",
//                         answers: ["Yes", "No", "Some", "Only wild"], correctIndex: 0)
//            ])
//            // Add Fast Food, Drinks, Desserts, World Food
//        ]
//    ),
//
//    // GEOGRAPHIC
//    Category(
//        title: "Geographic",
//        imageName: "geographic",
//        subcategories: [
//            Subcategory(title: "Countries", questions: [
//                Question(label: "Q1", text: "Largest country?",
//                         answers: ["USA", "China", "Russia", "Canada"], correctIndex: 2)
//            ])
//            // Add Capitals, Oceans, Mountains, Maps
//        ]
//    )
//]



//let categories: [Category]  = [
//
//    // MARK: - ENTERTAINMENT
//    Category(
//        title: "Entertainment",
//        subcategories: [
//
//            Subcategory(title: "Movies", questions: [
//                Question(label: "Q1", text: "Who directed Titanic?",
//                         answers: ["James Cameron", "Spielberg", "Nolan", "Scorsese"], correctIndex: 0),
//                Question(label: "Q2", text: "Which movie features Forrest Gump?",
//                         answers: ["Forrest Gump", "Cast Away", "Titanic", "Rocky"], correctIndex: 0),
//                Question(label: "Q3", text: "What year was Avatar released?",
//                         answers: ["2007", "2009", "2011", "2013"], correctIndex: 1),
//                Question(label: "Q4", text: "Best Picture winner 2020?",
//                         answers: ["Parasite", "1917", "Joker", "Ford v Ferrari"], correctIndex: 0)
//            ]),
//
//            Subcategory(title: "Music", questions: [
//                Question(label: "Q1", text: "Who is the King of Pop?",
//                         answers: ["Elvis", "Prince", "Michael Jackson", "Drake"], correctIndex: 2),
//                Question(label: "Q2", text: "Which instrument has 88 keys?",
//                         answers: ["Piano", "Guitar", "Violin", "Drums"], correctIndex: 0),
//                Question(label: "Q3", text: "Who sang Shape of You?",
//                         answers: ["Ed Sheeran", "Justin Bieber", "Adele", "Bruno Mars"], correctIndex: 0),
//                Question(label: "Q4", text: "Bohemian Rhapsody band?",
//                         answers: ["Queen", "Beatles", "U2", "Coldplay"], correctIndex: 0)
//            ]),
//
//            Subcategory(title: "TV Shows", questions: [
//                Question(label: "Q1", text: "Walter White appears in?",
//                         answers: ["Breaking Bad", "Lost", "Dexter", "Ozark"], correctIndex: 0),
//                Question(label: "Q2", text: "Show set in Hawkins?",
//                         answers: ["Dark", "Stranger Things", "Riverdale", "Euphoria"], correctIndex: 1),
//                Question(label: "Q3", text: "Central Perk is in?",
//                         answers: ["Friends", "Seinfeld", "How I Met Your Mother", "The Office"], correctIndex: 0),
//                Question(label: "Q4", text: "Show with dragons?",
//                         answers: ["Vikings", "Game of Thrones", "The Witcher", "Merlin"], correctIndex: 1)
//            ]),
//
//            Subcategory(title: "Video Games", questions: [
//                Question(label: "Q1", text: "Who created Mario?",
//                         answers: ["Sony", "Nintendo", "Sega", "Xbox"], correctIndex: 1),
//                Question(label: "Q2", text: "Link appears in?",
//                         answers: ["Zelda", "Mario", "Halo", "Final Fantasy"], correctIndex: 0),
//                Question(label: "Q3", text: "Sony console released in 2020?",
//                         answers: ["PS3", "PS4", "PS5", "PS6"], correctIndex: 2),
//                Question(label: "Q4", text: "Fortnite genre?",
//                         answers: ["RPG", "Shooter", "Battle Royale", "Strategy"], correctIndex: 2)
//            ]),
//
//            Subcategory(title: "Celebrities", questions: [
//                Question(label: "Q1", text: "Who played Iron Man?",
//                         answers: ["Chris Evans", "Robert Downey Jr.", "Chris Hemsworth", "Hugh Jackman"], correctIndex: 1),
//                Question(label: "Q2", text: "Wonder Woman actress?",
//                         answers: ["Gal Gadot", "Scarlett Johansson", "Emma Watson", "Zendaya"], correctIndex: 0),
//                Question(label: "Q3", text: "Actor with most Oscars?",
//                         answers: ["Daniel Day-Lewis", "Tom Hanks", "Denzel Washington", "Leonardo DiCaprio"], correctIndex: 0),
//                Question(label: "Q4", text: "Who owns Tesla?",
//                         answers: ["Jeff Bezos", "Bill Gates", "Elon Musk", "Mark Zuckerberg"], correctIndex: 2)
//            ])
//        ]
//    ),
//
//    // MARK: - USELESS FACTS
//    GameCategory(
//        title: "Useless Facts",
//        subcategories: [
//
//            Subcategory(title: "Random", questions: [
//                Question(label: "Q1", text: "Original Coca-Cola color?",
//                         answers: ["Clear", "Green", "Brown", "Black"], correctIndex: 0),
//                Question(label: "Q2", text: "Animal that never sleeps?",
//                         answers: ["Bullfrog", "Shark", "Ant", "Dolphin"], correctIndex: 0),
//                Question(label: "Q3", text: "How many hearts does an octopus have?",
//                         answers: ["1", "2", "3", "4"], correctIndex: 2),
//                Question(label: "Q4", text: "Do bananas float?",
//                         answers: ["Yes", "No", "Only ripe", "Only green"], correctIndex: 0)
//            ]),
//
//            Subcategory(title: "Science", questions: [
//                Question(label: "Q1", text: "Humans share DNA with bananas?",
//                         answers: ["20%", "40%", "60%", "80%"], correctIndex: 1),
//                Question(label: "Q2", text: "Hottest planet?",
//                         answers: ["Mercury", "Venus", "Mars", "Jupiter"], correctIndex: 1),
//                Question(label: "Q3", text: "Metal liquid at room temp?",
//                         answers: ["Iron", "Mercury", "Gold", "Silver"], correctIndex: 1),
//                Question(label: "Q4", text: "Lightning hotter than sun?",
//                         answers: ["Yes", "No", "Sometimes", "Unknown"], correctIndex: 0)
//            ]),
//
//            Subcategory(title: "Animals", questions: [
//                Question(label: "Q1", text: "Can cows have best friends?",
//                         answers: ["Yes", "No", "Sometimes", "Only calves"], correctIndex: 0),
//                Question(label: "Q2", text: "Wombat poop shape?",
//                         answers: ["Round", "Square", "Triangle", "Oval"], correctIndex: 1),
//                Question(label: "Q3", text: "Flamingos are born?",
//                         answers: ["Pink", "White", "Gray", "Orange"], correctIndex: 1),
//                Question(label: "Q4", text: "Sharks existed before trees?",
//                         answers: ["Yes", "No", "Same time", "Unknown"], correctIndex: 0)
//            ]),
//
//            Subcategory(title: "Human Body", questions: [
//                Question(label: "Q1", text: "Strongest muscle by force?",
//                         answers: ["Heart", "Tongue", "Jaw", "Leg"], correctIndex: 2),
//                Question(label: "Q2", text: "Bones in human body?",
//                         answers: ["196", "206", "216", "226"], correctIndex: 1),
//                Question(label: "Q3", text: "Skin is largest organ?",
//                         answers: ["Yes", "No", "Brain", "Liver"], correctIndex: 0),
//                Question(label: "Q4", text: "Humans glow in the dark?",
//                         answers: ["Yes", "No", "Only babies", "Only eyes"], correctIndex: 0)
//            ]),
//
//            Subcategory(title: "History", questions: [
//                Question(label: "Q1", text: "Cleopatra was Greek?",
//                         answers: ["Yes", "No", "Half", "Unknown"], correctIndex: 0),
//                Question(label: "Q2", text: "Napoleon was short?",
//                         answers: ["Yes", "No", "Average", "Unknown"], correctIndex: 1),
//                Question(label: "Q3", text: "First alarm clock rang at?",
//                         answers: ["4am", "6am", "8am", "Only one time"], correctIndex: 3),
//                Question(label: "Q4", text: "Vikings wore horned helmets?",
//                         answers: ["Yes", "No", "Sometimes", "Only leaders"], correctIndex: 1)
//            ])
//        ]
//    ),
//
//    // MARK: - FOOD & DRINK
//    GameCategory(
//        title: "Food & Drink",
//        subcategories: [
//
//            Subcategory(title: "Fruits", questions: [
//                Question(label: "Q1", text: "Strawberries have seeds on outside?",
//                         answers: ["Yes", "No", "Some", "Only wild"], correctIndex: 0),
//                Question(label: "Q2", text: "Bananas are berries?",
//                         answers: ["Yes", "No", "Sometimes", "Only ripe"], correctIndex: 0),
//                Question(label: "Q3", text: "Avocado is a?",
//                         answers: ["Vegetable", "Berry", "Nut", "Seed"], correctIndex: 1),
//                Question(label: "Q4", text: "Apples float in water?",
//                         answers: ["Yes", "No", "Sometimes", "Only green"], correctIndex: 0)
//            ]),
//
//            Subcategory(title: "Fast Food", questions: [
//                Question(label: "Q1", text: "Big Mac has how many patties?",
//                         answers: ["1", "2", "3", "4"], correctIndex: 1),
//                Question(label: "Q2", text: "KFC founded in?",
//                         answers: ["USA", "UK", "Canada", "Australia"], correctIndex: 0),
//                Question(label: "Q3", text: "Pizza originally from?",
//                         answers: ["France", "USA", "Italy", "Spain"], correctIndex: 2),
//                Question(label: "Q4", text: "World’s largest fast food chain?",
//                         answers: ["KFC", "McDonald's", "Subway", "Burger King"], correctIndex: 1)
//            ]),
//
//            Subcategory(title: "Drinks", questions: [
//                Question(label: "Q1", text: "Coffee is made from?",
//                         answers: ["Beans", "Seeds", "Berries", "Leaves"], correctIndex: 2),
//                Question(label: "Q2", text: "Tea origin country?",
//                         answers: ["India", "China", "Japan", "UK"], correctIndex: 1),
//                Question(label: "Q3", text: "Coca-Cola contains caffeine?",
//                         answers: ["Yes", "No", "Only diet", "Only zero"], correctIndex: 0),
//                Question(label: "Q4", text: "Milkshake is?",
//                         answers: ["Solid", "Gas", "Liquid", "Frozen"], correctIndex: 2)
//            ]),
//
//            Subcategory(title: "Desserts", questions: [
//                Question(label: "Q1", text: "Ice cream invented in?",
//                         answers: ["Italy", "China", "France", "USA"], correctIndex: 1),
//                Question(label: "Q2", text: "Chocolate comes from?",
//                         answers: ["Beans", "Leaves", "Roots", "Nuts"], correctIndex: 0),
//                Question(label: "Q3", text: "Cake needs yeast?",
//                         answers: ["Yes", "No", "Sometimes", "Only sponge"], correctIndex: 1),
//                Question(label: "Q4", text: "Macaron origin?",
//                         answers: ["Italy", "France", "Spain", "Germany"], correctIndex: 1)
//            ]),
//
//            Subcategory(title: "World Food", questions: [
//                Question(label: "Q1", text: "Sushi country?",
//                         answers: ["China", "Japan", "Korea", "Thailand"], correctIndex: 1),
//                Question(label: "Q2", text: "Tacos originate from?",
//                         answers: ["Brazil", "Mexico", "Spain", "USA"], correctIndex: 1),
//                Question(label: "Q3", text: "Paella is from?",
//                         answers: ["Italy", "Portugal", "Spain", "France"], correctIndex: 2),
//                Question(label: "Q4", text: "Curry originated in?",
//                         answers: ["India", "China", "Thailand", "Japan"], correctIndex: 0)
//            ])
//        ]
//    ),
//
//    // MARK: - GEOGRAPHIC
//    GameCategory(
//        title: "Geographic",
//        subcategories: [
//
//            Subcategory(title: "Countries", questions: [
//                Question(label: "Q1", text: "Largest country?",
//                         answers: ["USA", "China", "Russia", "Canada"], correctIndex: 2),
//                Question(label: "Q2", text: "Most populated country?",
//                         answers: ["India", "China", "USA", "Indonesia"], correctIndex: 0),
//                Question(label: "Q3", text: "Land of the Rising Sun?",
//                         answers: ["China", "Japan", "Korea", "Thailand"], correctIndex: 1),
//                Question(label: "Q4", text: "Only continent-country?",
//                         answers: ["Africa", "Australia", "Europe", "Asia"], correctIndex: 1)
//            ]),
//
//            Subcategory(title: "Capitals", questions: [
//                Question(label: "Q1", text: "Capital of Canada?",
//                         answers: ["Toronto", "Vancouver", "Ottawa", "Montreal"], correctIndex: 2),
//                Question(label: "Q2", text: "Capital of Australia?",
//                         answers: ["Sydney", "Melbourne", "Canberra", "Perth"], correctIndex: 2),
//                Question(label: "Q3", text: "Capital of Brazil?",
//                         answers: ["Rio", "Brasília", "São Paulo", "Salvador"], correctIndex: 1),
//                Question(label: "Q4", text: "Capital of Turkey?",
//                         answers: ["Istanbul", "Ankara", "Izmir", "Antalya"], correctIndex: 1)
//            ]),
//
//            Subcategory(title: "Oceans", questions: [
//                Question(label: "Q1", text: "Largest ocean?",
//                         answers: ["Atlantic", "Indian", "Pacific", "Arctic"], correctIndex: 2),
//                Question(label: "Q2", text: "Smallest ocean?",
//                         answers: ["Indian", "Southern", "Arctic", "Atlantic"], correctIndex: 2),
//                Question(label: "Q3", text: "Dead Sea is?",
//                         answers: ["Sea", "Lake", "Ocean", "River"], correctIndex: 1),
//                Question(label: "Q4", text: "Mariana Trench in?",
//                         answers: ["Atlantic", "Pacific", "Indian", "Arctic"], correctIndex: 1)
//            ]),
//
//            Subcategory(title: "Mountains", questions: [
//                Question(label: "Q1", text: "Highest mountain?",
//                         answers: ["K2", "Everest", "Kilimanjaro", "Denali"], correctIndex: 1),
//                Question(label: "Q2", text: "Himalayas located in?",
//                         answers: ["Africa", "Europe", "Asia", "America"], correctIndex: 2),
//                Question(label: "Q3", text: "Mount Fuji country?",
//                         answers: ["China", "Japan", "Korea", "Thailand"], correctIndex: 1),
//                Question(label: "Q4", text: "Alps are in?",
//                         answers: ["Asia", "Europe", "Africa", "America"], correctIndex: 1)
//            ]),
//
//            Subcategory(title: "Maps", questions: [
//                Question(label: "Q1", text: "Equator divides?",
//                         answers: ["East/West", "North/South", "Land/Sea", "Hot/Cold"], correctIndex: 1),
//                Question(label: "Q2", text: "Prime Meridian passes through?",
//                         answers: ["Paris", "Greenwich", "Rome", "Berlin"], correctIndex: 1),
//                Question(label: "Q3", text: "Lines on map?",
//                         answers: ["Lat/Long", "Roads", "Borders", "Shadows"], correctIndex: 0),
//                Question(label: "Q4", text: "North on compass is?",
//                         answers: ["Up", "Down", "Left", "Right"], correctIndex: 0)
//            ])
//        ]
//    )
//]
