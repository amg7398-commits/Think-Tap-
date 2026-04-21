

//
//  CategoryData.swift
//  ThinkTap
//
//
//
//
//
import SwiftUI

// ===========
// MODELS
// ===========

struct TriviaQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctAnswer: String
    var isAnswered: Bool = false
    var wasCorrect: Bool? = nil  // this is for green and gray / correct or incorrect
    
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

// =======================
//  FULL BOARD DATA (5x4)
// =======================

let fullBoardData: [TriviaCategory] = [

    // ------------------ Entertainment ------------------
    TriviaCategory(name: "Entertainment", imageName: "Entertainment", subcategories: [
        TriviaSubcategory(name: "Video Games", questions: [
            TriviaQuestion(question: "What was the name of the major video game console released in 1985?", options: ["Atari 2600 Game System", "Sega Master System", "Playstation", "Nintendo Entertainment System (NES)"], correctAnswer: "Nintendo Entertainment System (NES)"),
            TriviaQuestion(question: "What company is behind the Playstation brand?", options: ["Microsoft", "Apple", "Sony", "Nintendo"], correctAnswer: "Sony"),
            TriviaQuestion(question: "What color is Pac-Man?", options: ["Green", "Red", "Yellow", "Blue"], correctAnswer: "Yellow"),
            TriviaQuestion(question: "What genre of video game is Super Mario?", options: ["Action", "Platformer", "Strategy", "RPG"], correctAnswer: "Platformer")
        ]),
        TriviaSubcategory(name: "Music", questions: [
            TriviaQuestion(question: "What year was the cassette tape introduced as a medium for recorded music in the USA?", options: ["1961", "1965", "1966", "1968"], correctAnswer: "1966"),
            TriviaQuestion(question: "What was the first song to break the 3 minute mark on FM radio in the 70’s?", options: ["Won’t Get Fooled Again by The Who", "American Pie by Don McClean", "Aqualung by Jethro Tull", "Like a Rolling Stone by Bob Dylan"], correctAnswer: "Like a Rolling Stone by Bob Dylan"),
            TriviaQuestion(question: "What name is Robert Weston Smith better known as?", options: ["Dr. Demento", "Wolfman Jack", "Murray the “K”", "The Big Bopper"], correctAnswer: "Wolfman Jack"),
            TriviaQuestion(question: "Which 70’s/80’s Rock Icons started their musical journey known as Tradwinds 4?", options: ["Fleetwood Mac", "Kansas", "Deep Purple", "Styx"], correctAnswer: "Styx")
        ]),
        TriviaSubcategory(name: "Movies", questions: [
            TriviaQuestion(question: "In the movie E.T. what candy does Elliott use to lure E.T.?", options: ["M&M’s", "Skittles", "Reese’s Pieces", "Smarties"], correctAnswer: "Reese’s Pieces"),
            TriviaQuestion(question: "What was the name of the mechanical Shark in the 1975 movie Jaws?", options: ["Chomper", "Bruce", "Sharky", "Fred"], correctAnswer: "Bruce"),
            TriviaQuestion(question: "What is the first rule of Fight Club in the 1999 Film?", options: ["Always protect yourself", "You don't talk about Fight Club", "No shirt, No Shoes", "Fights go on as long as they have to"], correctAnswer: "You don't talk about Fight Club"),
            TriviaQuestion(question: "In The Lord of the Rings: The Fellowship of the Ring, what is the name of Gandalf’s horse?", options: ["Shadowfax", "Brego", "Asfaloth", "Bill"], correctAnswer: "Shadowfax")
        ]),
        TriviaSubcategory(name: "TV", questions: [
            TriviaQuestion(question: "What is the name of the coffee shop in Friends?", options: ["Java Joe", "Central Perk", "The Daily Grind", "Cafe Central"], correctAnswer: "Central Perk"),
            TriviaQuestion(question: "In Stranger Things, what is Eleven’s favorite food?", options: ["Pizza", "Eggo waffles", "Chicken nuggets", "French fries"], correctAnswer: "Eggo waffles"),
            TriviaQuestion(question: "In The Office U.S. show, what city is the Dunder Mifflin branch located in?", options: ["Pittsburgh", "Philadelphia", "Scranton", "Allentown"], correctAnswer: "Scranton"),
            TriviaQuestion(question: "What is the family name in the The Simpsons?", options: ["Jones", "Simpson", "Smith", "Brown"], correctAnswer: "Simpson")
        ]),
        TriviaSubcategory(name: "Sports", questions: [
            TriviaQuestion(question: "What baseball player hit 60 home runs in 1927, a record that stood for 34 years?", options: ["Lou Gehrig", "Babe Ruth", "Jimmie Foxx", "Hank Greenberg"], correctAnswer: "Babe Ruth"),
            TriviaQuestion(question: "What sport does Lebron James play?", options: ["Football", "Basketball", "Baseball", "Soccer"], correctAnswer: "Basketball"),
            TriviaQuestion(question: "What is it called when a bowler makes three strikes in a row?", options: ["A triple", "A perfect game", "A turkey", "A hat trick"], correctAnswer: "A turkey"),
            TriviaQuestion(question: "How many points is a touchdown worth in football?", options: ["3", "6", "7", "10"], correctAnswer: "6")
        ])
    ]),
    
    // ------------------ Useless Facts ------------------
    TriviaCategory(name: "Useless Facts", imageName: "UselessFacts", subcategories: [
    TriviaSubcategory(name: "Random", questions: [
    TriviaQuestion(question: "What everyday object was originally lnvented to avoid touching food with your hands?", options: ["Spoon", "Fork", "Napkin", "Plate"], correctAnswer: "Fork"),
    TriviaQuestion(question: "What was Elvis Presley’s occupation before he became a rock star?", options: ["A cook", "Farmer", "A inmate", "A truck driver"], correctAnswer: "A truck driver"),
    TriviaQuestion(question: "Which animal sleeps the least amount of time per day?", options: ["Dolphin", "Giraffe", "Horse", "Elephant"], correctAnswer: "Giraffe"),
    TriviaQuestion(question: "What everyday item was once made using human hair?", options: ["Toothbrush", "Paintbrush", "Pillow stuffing", "Violin"], correctAnswer: "Toothbrush")
    ]),
    TriviaSubcategory(name: "Parenting", questions: [
    TriviaQuestion(question: "How many diapers does the average baby use in their first year?", options: ["About 800", "About 1500", "About 2500", "About 3500"], correctAnswer: "About 2500"),
    TriviaQuestion(question: "What is the most common first word babies say worldwide?", options: ["Mama", "Dada", "No", "Milk"], correctAnswer: "Dada"),
    TriviaQuestion(question: "Why do toddlers often take off their shoes in the worst possible places?", options: ["Shoes feel restrictive", "They like attention", "They forgot they’re wearing them", "It’s a sensory preference"], correctAnswer: "It’s a sensory preference"),
    TriviaQuestion(question: "What phrase do parents hear most during the teen years?", options: ["Can you help me?", "I hate you", "I’m bored", "I’m hungry"], correctAnswer: "I’m hungry")
    ]),
    TriviaSubcategory(name: "Tools", questions: [
    TriviaQuestion(question: "What common tool was orginally designed to pull nails, not drive them?", options: ["Hammer", "Wrench", "Screwdriver", "Pliers"], correctAnswer: "Hammer"),
    TriviaQuestion(question: "Which tool is named after the sound it makes when used?", options: ["Drill", "Chisel", "Saw", "Level"], correctAnswer: "Saw"),
    TriviaQuestion(question: "What material were early measuring tapes made from before metal?", options: ["Leather", "Cotton", "Wood", "Paper"], correctAnswer: "Leather"),
    TriviaQuestion(question: "Why are most screw threads twisted to the right?", options: ["It looks better", "Most people are right-handed", "It reduces vibration", "It uses less metal"], correctAnswer: "Most people are right-handed")
    ]),
    TriviaSubcategory(name: "Locations", questions: [
    TriviaQuestion(question: "Which city is known as The Big Apple?", options: ["Los Angeles", "Chicago", "New York City", "Boston"], correctAnswer: "New York City"),
    TriviaQuestion(question: "Which country is shaped like a boot?", options: ["Spain", "Greece", "Italy", "Portugal"], correctAnswer: "Italy"),
    TriviaQuestion(question: "Which city has more bridges than Venice?", options: ["Paris", "London", "Hamburg", "Amsterdam"], correctAnswer: "Hamburg"),
    TriviaQuestion(question: "What is the only continent without an active volcano?", options: ["Europe", "Africa", "Australia", "Antarctica"], correctAnswer: "Europe")
    ]),
    TriviaSubcategory(name: "Business", questions: [
    TriviaQuestion(question: "Which company started out selling only books online?", options: ["eBay", "Google", "Amazon", "Apple"], correctAnswer: "Amazon"),
    TriviaQuestion(question: "What color is most commonly used in fast-food logos because it simulates appetite?", options: ["Blue", "Green", "Red", "Purple"], correctAnswer: "Red"),
    TriviaQuestion(question: "Which famous company’s original name was BackRub?", options: ["Yahoo", "Google", "Microsoft", "Netflix"], correctAnswer: "Google"),
    TriviaQuestion(question: "What was the first product ever sold by Nintendo before video games?", options: ["Board games", "Toys", "Playing cards", "Electronics"], correctAnswer: "Playing cards")
    ])
    ]),
    
    // ------------------ Food & Drink ------------------
    TriviaCategory(name: "Food & Drink", imageName: "Food&Drink", subcategories: [
    TriviaSubcategory(name: "Restaurants", questions: [
    TriviaQuestion(question: "Which restaurant is famous for its Golden Arches logo?", options: ["Burger King", "Wendy's", "McDonald's", "KFC"], correctAnswer: "McDonald's"),
    TriviaQuestion(question: "Which restaurant is best known for bottomless breadsticks?", options: ["Olive Garden", "Pizza Hut", "Domino's", "Papa John's"], correctAnswer: "Olive Garden"),
    TriviaQuestion(question: "Which restaurant chain is associated with the slogan Finger Lickin' Good?", options: ["Popeyes", "Chick-fil-A", "KFC", "Church's Chicken"], correctAnswer: "KFC"),
    TriviaQuestion(question: "Which restaurant is famous for its footlong sandwiches?", options: ["Panera Bread", "Jimmy John's", "Subway", "Jersey Mike's"], correctAnswer: "Subway")
    ]),
    TriviaSubcategory(name: "Fountain Drinks", questions: [
    TriviaQuestion(question: "Which soft drink was originally created as a medicinal tonic in 1885?", options: ["Root beer", "Pepsi", "Coca-Cola", "7UP"], correctAnswer: "Coca-Cola"),
    TriviaQuestion(question: "Which fountain drink is flavored with 23 different flavors?", options: ["Mountain Dew", "Dr. Pepper", "Fanta", "Vernor's"], correctAnswer: "Dr. Pepper"),
    TriviaQuestion(question: "Which fountain drink is most closely associated with Taco Bell?", options: ["Pepsi", "Baja Blast", "Sierra Mist", "Faygo"], correctAnswer: "Baja Blast"),
    TriviaQuestion(question: "Which orange-flavored soda is commonly found in movie-theater fountain machines?", options: ["Crush", "Fanta", "Sunkist", "All of the above"], correctAnswer: "All of the above")
    ]),
    TriviaSubcategory(name: "Terminology", questions: [
    TriviaQuestion(question: "What does the culinary term al dente mean?", options: ["Overcooked", "Firm to the bite", "Soft and mushy", "Burnt"], correctAnswer: "Firm to the bite"),
    TriviaQuestion(question: "What does braising involve?", options: ["Cleaning the kitchen", "Cooking at high heat", "Preparing ingredients", "Serving food"], correctAnswer: "Cooking at high heat"),
    TriviaQuestion(question: "What is umami often described as?", options: ["Sweet", "Sour", "Bitter", "Savory"], correctAnswer: "Savory"),
    TriviaQuestion(question: "What does it mean to deglaze a pan?", options: ["Cool it down", "Remove excess oil", "Add liquid to loosen browned bits", "Scrub it clean"], correctAnswer: "Add liquid to loosen browned bits")
    ]),
    TriviaSubcategory(name: "Fast-Food", questions: [
    TriviaQuestion(question: "Which fast-food chain is credited with popularizing the drive-thru?", options: ["McDonald's", "Wendy's", "In-N-Out Burger", "Sonic Drive In"], correctAnswer: "In-N-Out Burger"),
    TriviaQuestion(question: "Which chain introduced the Crunchwrap Supreme?", options: ["Taco Bell", "Chipolte", "Del Taco", "Qdoba"], correctAnswer: "Taco Bell"),
    TriviaQuestion(question: "What meat is traditionally used in a classic Arby's sandwich?", options: ["Turkey", "Roast beef", "Ham", "Brisket"], correctAnswer: "Roast beef"),
    TriviaQuestion(question: "What is the signature sauce on a Big Mac called?", options: ["Special sauce", "Big sauce", "Mac sauce", "Secret sauce"], correctAnswer: "Special sauce")
    ]),
    TriviaSubcategory(name: "Luxury Food", questions: [
    TriviaQuestion(question: "Which type of caviar is considered the most expensive in the world?", options: ["Osetra", "Sevruga", "Beluga", "Hackleback"], correctAnswer: "Beluga"),
    TriviaQuestion(question: "Kobe beef originates from which country?", options: ["United States", "France", "Japan", "Australia"], correctAnswer: "Japan"),
    TriviaQuestion(question: "What precious metal is sometimes used as a garnish in luxury desserts and cocktails?", options: ["Platinum", "Silver", "Copper", "Gold"], correctAnswer: "Gold"),
    TriviaQuestion(question: "Which luxury seafood is known for its long legs and sweet meat?", options: ["Lobster", "King crab", "Snow crab", "Blue crab"], correctAnswer: "King crab")
    ])
    ]),
   
    // ------------------ Geography ------------------
        TriviaCategory(name: "Geography", imageName: "Geography", subcategories: [
            TriviaSubcategory(name: "Countries", questions: [
                TriviaQuestion(question: "Which country has the largest land area in the world?", options: ["Canada", "China", "United States", "Russia"], correctAnswer: "Russia"),
                TriviaQuestion(question: "What is the smallest country in the world by land area?", options: ["Monaco", "San Marino", "Vatican City", "Liechtenstein"], correctAnswer: "Vatican City"),
                TriviaQuestion(question: "Which country has the most time zones?", options: ["Russia", "United States", "France", "Australia"], correctAnswer: "France"),
                TriviaQuestion(question: "Which country contains the most lakes?", options: ["Finland", "Sweden", "Canada", "Norway"], correctAnswer: "Canada")
            ]),
            TriviaSubcategory(name: "States", questions: [
                TriviaQuestion(question: "Which U.S. state is the largest by land area?", options: ["Texas", "California", "Alaska", "Montana"], correctAnswer: "Alaska"),
                TriviaQuestion(question: "What is the smallest U.S. state by land area?", options: ["Delaware", "Rhode Island", "Connecticut", "New Jersey"], correctAnswer: "Rhode Island"),
                TriviaQuestion(question: "Which U.S. state is known as the Sunshine State?", options: ["California", "Arizona", "Florida", "Nevada"], correctAnswer: "Florida"),
                TriviaQuestion(question: "Which state was the last to join the United States?", options: ["Alaska", "Hawaii", "Arizona", "New Mexico"], correctAnswer: "Hawaii")
            ]),
            TriviaSubcategory(name: "Language", questions: [
                TriviaQuestion(question: "Which language has the most native speakers worldwide?", options: ["English", "Spanish", "Mandarin Chinese", "Hindi"], correctAnswer: "Mandarin Chinese"),
                TriviaQuestion(question: "Which country has the most official languages?", options: ["Canada", "India", "Switzerland", "South Africa"], correctAnswer: "South Africa"),
                TriviaQuestion(question: "What language is mainly spoken in Quebec, Canada?", options: ["English", "French", "Spanish", "German"], correctAnswer: "French"),
                TriviaQuestion(question: "What language family does English belong to?", options: ["Romance", "Slavic", "Germanic", "Celtic"], correctAnswer: "Germanic")
            ]),
            TriviaSubcategory(name: "Schools", questions: [
                TriviaQuestion(question: "Which university is located in Cambridge, Massachusetts?", options: ["Yale University", "Harvard University", "MIT", "Tufts University"], correctAnswer: "Harvard University"),
                TriviaQuestion(question: "Which school is located in Palo Alto, California?", options: ["UC Berkeley", "UCLA", "Stanford University", "Caltech"], correctAnswer: "Stanford University"),
                TriviaQuestion(question: "Which school is located in Ann Arbor, Michigan?", options: ["Michigan State University", "University of Michigan", "Wayne State University", "Purdue University"], correctAnswer: "University of Michigan"),
                TriviaQuestion(question: "Which university is located in Berkeley, California?", options: ["Stanford University", "UC Berkeley", "UCLA", "UC San Diego"], correctAnswer: "UC Berkeley")
            ]),
            TriviaSubcategory(name: "Cities", questions: [
                TriviaQuestion(question: "Which city is known as The Big Apple?", options: ["Los Angeles", "New York City", "Chicago", "Boston"], correctAnswer: "New York City"),
                TriviaQuestion(question: "What city is famous for its canals and gondolas?", options: ["Amsterdam", "Bruges", "Venice", "Stockholm"], correctAnswer: "Venice"),
                TriviaQuestion(question: "Which city is nicknamed The Windy City?", options: ["Minneapolis", "San Francisco", "Chicago", "Detroit"], correctAnswer: "Chicago"),
                TriviaQuestion(question: "Which city was divided by a wall from 1961 to 1989?", options: ["Vienna", "Warsaw", "Prague", "Berlin"], correctAnswer: "Berlin")
            ])
        ]),
    
    // ------------------ General ------------------
        TriviaCategory(name: "General", imageName: "General", subcategories: [
            TriviaSubcategory(name: "Celebrities", questions: [
                TriviaQuestion(question: "Which actor played Jack Dawson in the Titanic?", options: ["Brad Pitt", "Johnny Depp", "Leonardo DiCaprio", "Tom Cruise"], correctAnswer: "Leonardo DiCaprio"),
                TriviaQuestion(question: "Which singer is known as the Queen of Pop?", options: ["Britney Spears", "Madonna", "Lady Gaga", "Beyoncé"], correctAnswer: "Madonna"),
                TriviaQuestion(question: "Which celebrity founded the cosmetics brand Fenty Beauty?", options: ["Rihanna", "Kim Kardashian", "Selena Gomez", "Ariana Grande"], correctAnswer: "Rihanna"),
                TriviaQuestion(question: "Which actor portrayed Iron Man in the Marvel Cinematic Universe?", options: ["Chris Evans", "Chris Hemsworth", "Robert Downey Jr.", "Mark Ruffalo"], correctAnswer: "Robert Downey Jr.")
            ]),
            TriviaSubcategory(name: "Animals", questions: [
                TriviaQuestion(question: "Which animal is known as the largest land animal on Earth?", options: ["Giraffe", "African Elephant", "Hippopotamus", "Rhinoceros"], correctAnswer: "African Elephant"),
                TriviaQuestion(question: "What is the fastest land animal?", options: ["Lion", "Cheetah", "Horse", "Greyhound"], correctAnswer: "Cheetah"),
                TriviaQuestion(question: "Which animal is known for having a black-and-white striped coat?", options: ["Tiger", "Zebra", "Skunk", "Panda"], correctAnswer: "Zebra"),
                TriviaQuestion(question: "What type of animal is a Komodo dragon?", options: ["Amphibian", "Mammal", "Reptile", "Bird"], correctAnswer: "Reptile")
            ]),
            TriviaSubcategory(name: "Pop Culture", questions: [
                TriviaQuestion(question: "Which movie features the fictional African nation of Wakanda?", options: ["Avatar", "Black Panther", "The Lion King", "Dune"], correctAnswer: "Black Panther"),
                TriviaQuestion(question: "Which social media app is known for short-form videos?", options: ["Instagram", "Snapchat", "TikTok", "Twitter"], correctAnswer: "TikTok"),
                TriviaQuestion(question: "Who is the pop star behind the Eras Tour?", options: ["Ariana Grande", "Taylor Swift", "Billie Eilish", "Dua Lipa"], correctAnswer: "Taylor Swift"),
                TriviaQuestion(question: "Which TV show features the characters Eleven and Mike?", options: ["The Umbrella Academy", "Stranger Things", "The Walking Dead", "Riverdale"], correctAnswer: "Stranger Things")
            ]),
            TriviaSubcategory(name: "History/Years", questions: [
                TriviaQuestion(question: "In which year did World War II end?", options: ["1943", "1944", "1945", "1946"], correctAnswer: "1945"),
                TriviaQuestion(question: "In what year did the Apollo 11 Moon Landing occur?", options: ["1965", "1967", "1969", "1972"], correctAnswer: "1969"),
                TriviaQuestion(question: "The Fall of the Berlin Wall happened in which year?", options: ["1987", "1988", "1989", "1991"], correctAnswer: "1989"),
                TriviaQuestion(question: "In which year did the Declaration of Independence get signed?", options: ["1774", "1775", "1776", "1777"], correctAnswer: "1776")
            ]),
            TriviaSubcategory(name: "Holidays", questions: [
                TriviaQuestion(question: "On which date is Christmas Day celebrated?", options: ["December 24", "December 25", "December 31", "January"], correctAnswer: "December 25"),
                TriviaQuestion(question: "Which country is credited with starting the tradition of Halloween?", options: ["United States", "Ireland", "Germany", "Mexico"], correctAnswer: "Ireland"),
                TriviaQuestion(question: "What is the main food traditionally eaten on Thanksgiving?", options: ["Ham", "Roast beef", "Turkey", "Chicken"], correctAnswer: "Turkey"),
                TriviaQuestion(question: "The festival of lights, Diwali, originated in which country?", options: ["China", "India", "Thailand", "Japan"], correctAnswer: "India")
            ])
        ]),

    // ------------------ Science ------------------
        TriviaCategory(name: "Science", imageName: "Science", subcategories: [
            TriviaSubcategory(name: "Politics", questions: [
                TriviaQuestion(question: "Which branch of science studies government systems and political behavior?", options: ["Sociology", "Economics", "Political Science", "Anthropology"], correctAnswer: "Political Science"),
                TriviaQuestion(question: "What term describes a system where power is generally held by the people?", options: ["Monarchy", "Oligarchy", "Democracy", "Dictatorship"], correctAnswer: "Democracy"),
                TriviaQuestion(question: "Which concept refers to the divison of government responsibilities?", options: ["Federalism", "Separation of Powers", "Judicial Review", "Checks and Balances"], correctAnswer: "Separation of Powers"),
                TriviaQuestion(question: "In political science, what does public opinion refer to?", options: ["Laws passed by Congress", "Decisions made by courts", "The views of citizens about political issues", "Government budgets"], correctAnswer: "The views of citizens about political issues")
            ]),
                TriviaSubcategory(name: "Law", questions: [
                    TriviaQuestion(question: "Which academic field studies laws, legal systems, and judicial processes?", options: ["Criminology", "Sociology", "Jurisprudence", "Anthropology"], correctAnswer: "Jurisprudence"),
                    TriviaQuestion(question: "Which concept prevents a person from being tried twice for the same crime?", options: ["Judicial Review", "Due Process", "Double Jeopardy", "Probable Cause"], correctAnswer: "Double Jeopardy"),
                    TriviaQuestion(question: "What term refers to a court's authority to hear and decide a case?", options: ["Verdict", "Jurisdiction", "Indictment", "Litigation"], correctAnswer: "Jurisdiction"),
                    TriviaQuestion(question: "Which legal concept allows courts to evaluate whether laws are constitutional?", options: ["Habeas Corpus", "Judicial Review", "Subpoena", "Tort Law"], correctAnswer: "Judicial Review")
            ]),
            TriviaSubcategory(name: "Space", questions: [
                TriviaQuestion(question: "What is the largest planet in our solar system?", options: ["Earth", "Saturn", "Jupiter", "Neptune"], correctAnswer: "Jupiter"),
                TriviaQuestion(question: "What is the term for a star at the center of a solar system?", options: ["Planet", "Comet", "Sun", "Asteroid"], correctAnswer: "Sun"),
                TriviaQuestion(question: "Which planet is known as the Red Planet?", options: ["Mercury", "Mars", "Venus", "Jupiter"], correctAnswer: "Mars"),
                TriviaQuestion(question: "What is the name of the galaxy that contains our solar system?", options: ["Andromeda", "Milky Way", "Whirlpool", "Sombrero"], correctAnswer: "Milky Way")
            ]),
            TriviaSubcategory(name: "Biology", questions: [
                TriviaQuestion(question: "What is the basic unit of life?", options: ["Atom", "Cell", "Molecule", "Tissue"], correctAnswer: "Cell"),
                TriviaQuestion(question: "Which macromolecule stores genetic information?", options: ["Carbohydrates", "Proteins", "DNA", "Lipids"], correctAnswer: "DNA"),
                TriviaQuestion(question: "What organelle is known as the powerhouse of the cell?", options: ["Nucleus", "Mitochondria", "Ribosome", "Golgi Apparatus"], correctAnswer: "Mitochondria"),
                TriviaQuestion(question: "Which process do plants use to convert sunlight into chemical energy?", options: ["Respiration", "Photosynthesis", "Fermentation", "Transpiration"], correctAnswer: "Photosynthesis")
            ]),
            TriviaSubcategory(name: "Chemistry", questions: [
                TriviaQuestion(question: "What is the chemical symbol for gold?", options: ["Ag", "Au", "Gd", "Ga"], correctAnswer: "Au"),
                TriviaQuestion(question: "What is the most abundant gas in Earth's atmosphere?", options: ["Oxygen", "Nitrogen", "Carbon Dioxide", "Hydrogen"], correctAnswer: "Nitrogen"),
                TriviaQuestion(question: "What is the process called when a solid turns directly into a gas?", options: ["Condensation", "Evaporation", "Sublimation", "Freezing"], correctAnswer: "Sublimation"),
                TriviaQuestion(question: "Which element is a noble gas?", options: ["Oxygen", "Nitrogen", "Argon", "Hydrogen"], correctAnswer: "Argon")
            ])
        ]),
    
    // ------------------ Travel ------------------
        TriviaCategory(name: "Travel", imageName: "Travel", subcategories: [
            TriviaSubcategory(name: "Biking", questions: [
                TriviaQuestion(question: "What is the term for a long-distance cycling trip often lasting several days or weeks?", options: ["Sprint", "Tour", "Century", "Trail"], correctAnswer: "Tour"),
                TriviaQuestion(question: "What type of bike is designed for off-road trails and rough terrain?", options: ["Road Bike", "Mountain Bike", "Hybrid Bike", "Cruiser"], correctAnswer: "Mountain Bike"),
                TriviaQuestion(question: "Which city hosts a famous bike-sharing program called Citi Bike?", options: ["London", "New York City", "Paris", "Tokyo"], correctAnswer: "New York City"),
                TriviaQuestion(question: "What essential gear must cyclists wear for safety?", options: ["Sunglasses", "Helmet", "Wristbands", "Elbow pads"], correctAnswer: "Helmet")
            ]),
                TriviaSubcategory(name: "Driving", questions: [
                    TriviaQuestion(question: "Which country drives on the left side of the road?", options: ["United States", "Germany", "Japan", "France"], correctAnswer: "Japan"),
                    TriviaQuestion(question: "Which famous highway runs along much of the U.S. from Chicago to Los Angeles?", options: ["Route 101", "Route 66", "Interstate 95", "Pacific Coast Highway"], correctAnswer: "Route 66"),
                    TriviaQuestion(question: "Which U.S. city is known for its famous spiral roads?", options: ["Los Angeles", "San Francisco", "Seattle", "Boston"], correctAnswer: "San Francisco"),
                    TriviaQuestion(question: "What is the international road sign for a roundabout usually depicted as?", options: ["Triangular sign", "Circular arrows", "Red octagon", "Blue square"], correctAnswer: "Circular arrows")
            ]),
            TriviaSubcategory(name: "Flying", questions: [
                TriviaQuestion(question: "Which U.S. airline is known as the oldest operating airline in the world?", options: ["Delta Airlines", "American Airlines", "United Airlines", "Embraer"], correctAnswer: "Delta Airlines"),
                TriviaQuestion(question: "What is the term for the flight path an aircraft follows?", options: ["Airway", "Flight Plan", "Flight Deck", "Flight Corridor"], correctAnswer: "Flight Plan"),
                TriviaQuestion(question: "What is the standard measurement used to describe the speed of an aircraft?", options: ["Miles per hour (mph)", "Kilometers per hour (km/h)", "Knots", "Mach"], correctAnswer: "Knots"),
                TriviaQuestion(question: "What term describes the vertical movement of an aircraft?", options: ["Roll", "Pitch", "Yaw", "Altitude Change"], correctAnswer: "Pitch")
            ]),
            TriviaSubcategory(name: "Transit", questions: [
                TriviaQuestion(question: "Which city is home to the world's oldest underground metro system?", options: ["Paris", "London", "New York City", "Berlin"], correctAnswer: "London"),
                TriviaQuestion(question: "Which Asian city has the largest subway system by the number of stations?", options: ["Tokyo", "Beijing", "Shanghai", "Seoul"], correctAnswer: "Tokyo"),
                TriviaQuestion(question: "Which type of train is powered by magnetic levitation?", options: ["Light rail", "Maglev train", "Commuter train", "Monorail"], correctAnswer: "Maglev train"),
                TriviaQuestion(question: "Which type of public transit runs on tracks but is often integrated with city streets?", options: ["Subway", "Tram", "Monorail", "Bus Rapid Transit"], correctAnswer: "Tram")
            ]),
            TriviaSubcategory(name: "Walking", questions: [
                TriviaQuestion(question: "Which U.S. trail stretches over 2,000 miles from Georgia to Maine?", options: ["Pacific Crest Trail", "Appalachian Trail", "Continental Divide Trail", "John Muir Trail"], correctAnswer: "Appalachian Trail"),
                TriviaQuestion(question: "What is the term for a long distance, often multi-day walking journey?", options: ["Sprint", "Hike", "Trek", "Stroll"], correctAnswer: "Trek"),
                TriviaQuestion(question: "What is the longest marked footpath in the United Kingdom?", options: ["West Highland Way", "South West Coast Path", "Hadrian's Wall Path", "Pennine Way"], correctAnswer: "South West Coast Path"),
                TriviaQuestion(question: "The Pacific Crest Trail runs through which countries?", options: ["USA and Canada", "USA only", "USA, Canada, and Mexico", "USA and Mexico"], correctAnswer: "USA only")
            ])
        ]),
    
    // ------------------ Technology ------------------
        TriviaCategory(name: "Technology", imageName: "Technology", subcategories: [
            TriviaSubcategory(name: "Phones", questions: [
                TriviaQuestion(question: "Which company created the iPhone?", options: ["Samsung", "Microsoft", "Apple", "Google"], correctAnswer: "Apple"),
                TriviaQuestion(question: "Which smartphone feature uses fingerprint or face recognition?", options: ["NFC", "Biometrics", "Bluetooth", "Google"], correctAnswer: "Biometrics"),
                TriviaQuestion(question: "What does NFC stand for?", options: ["Near Field Communication", "New Frequency Channel", "Network File Control", "Near Frame Connection"], correctAnswer: "Near Field Communication"),
                TriviaQuestion(question: "What is the main function of RAM in a smartphone?", options: ["Store photos permanently", "Run apps and multitask efficiently", "Power the device", "Improve camera quality"], correctAnswer: "Run apps and multitask efficiently")
            ]),
                TriviaSubcategory(name: "Computers", questions: [
                    TriviaQuestion(question: "Which company created the Windows operating system?", options: ["Apple", "IBM", "Microsoft", "Intel"], correctAnswer: "Microsoft"),
                    TriviaQuestion(question: "Which of the following is an example of an operating system?", options: ["Google Chrome", "Linux", "Microsoft Word", "Adobe Photoshop"], correctAnswer: "Linux"),
                    TriviaQuestion(question: "What is the primary function of an operating system?", options: ["Edit videos", "Manage hardware and software resources", "Browse the internet", "Create documents"], correctAnswer: "Manage hardware and software resources"),
                    TriviaQuestion(question: "What is the function of a firewall on a computer?", options: ["Cool the system", "Protect against unauthorized access", "Increase processing speed", "Store files"], correctAnswer: "Protect against unauthorized access")
            ]),
            TriviaSubcategory(name: "Internet History", questions: [
                TriviaQuestion(question: "Who is credited with inventing the World Wide Web?", options: ["Bill Gates", "Steve Jobs", "Tim Berners-Lee", "Vint Cerf"], correctAnswer: "Tim Berners-Lee"),
                TriviaQuestion(question: "Which early internet services allowed users to access email and forums in the 1990s?", options: ["Instagram", "TikTok", "AOL", "Snapchat"], correctAnswer: "AOL"),
                TriviaQuestion(question: "Which social media platform launched in 2004?", options: ["Twitter", "Facebook", "Youtube", "LinkedIn"], correctAnswer: "Facebook"),
                TriviaQuestion(question: "In what year was the World Wide Web publicly introduced?", options: ["1989", "1991", "1995", "2000"], correctAnswer: "1991")
            ]),
            TriviaSubcategory(name: "Celebrities", questions: [
                TriviaQuestion(question: "Which person founded Apple?", options: ["Bill Gates", "Steve Jobs", "Mark Zuckerberg", "Elon Musk"], correctAnswer: "Steve Jobs"),
                TriviaQuestion(question: "Which person created Facebook?", options: ["Evan Spiegel", "Jack Dorsey", "Mark Zuckerberg", "Reed Hastings"], correctAnswer: "Mark Zuckerberg"),
                TriviaQuestion(question: "Which person founded Amazon?", options: ["Larry Ellison", "Jeff Bezos", "Michael Dell", "Travis Kalanick"], correctAnswer: "Jeff Bezos"),
                TriviaQuestion(question: "Which person founded Google?", options: ["Eric Schmidt", "Larry Page", "Paul Allen", "Mark Zuckerberg"], correctAnswer: "Larry Page")
            ]),
            TriviaSubcategory(name: "Terminology", questions: [
                TriviaQuestion(question: "What does CPU stand for?", options: ["Central Process Unit", "Central Processing Unit", "Computer Personal Unit", "Core Processing Utility"], correctAnswer: "Central Processing Unit"),
                TriviaQuestion(question: "What does RAM stand for?", options: ["Read Access Memory", "Random Access Memory", "Rapid Action Memory", "Run Active Memory"], correctAnswer: "Random Access Memory"),
                TriviaQuestion(question: "What does GPU stand for?", options: ["General Processing Unit", "Graphics Processing Unit", "Graphic Performance Utility", "General Performance Unit"], correctAnswer: "Graphics Processing Unit"),
                TriviaQuestion(question: "What does USB stand for?", options: ["Universal Serial Bus", "Unified System Base", "Universal System Buffer", "United Serial Base"], correctAnswer: "Universal Serial Bus")
            ])
        ]),
    
    // ------------------ Art ------------------
        TriviaCategory(name: "Art", imageName: "Art", subcategories: [
            TriviaSubcategory(name: "Paintings", questions: [
                TriviaQuestion(question: "Who painted the Mona Lisa?", options: ["Vincent van Gogh", "Pablo Picasso", "Leonardo da Vinci", "Claude Monet"], correctAnswer: "Leonardo da Vinci"),
                TriviaQuestion(question: "Which artist created The Starry Night?", options: ["Claude Monet", "Vincent van Gogh", "Paul Cézanne", "Salvador Dalí"], correctAnswer: "Vincent van Gogh"),
                TriviaQuestion(question: "The Scream was painted by which artist?", options: ["Edvard Munch", "Gustav Kilmt", "Paul Gauguin", "Henri Rousseau"], correctAnswer: "Edvard Munch"),
                TriviaQuestion(question: "Who painted Water Lillies?", options: ["Edgar Degas", "Pierre-Auguste Renoir", "Claude Monet", "Camille Pissarro"], correctAnswer: "Claude Monet")
            ]),
                TriviaSubcategory(name: "Movements", questions: [
                    TriviaQuestion(question: "Which movement focused on accurate, detailed depictions of everyday life?", options: ["Realism", "Expressionism", "Futurism", "Dadaism"], correctAnswer: "Realism"),
                    TriviaQuestion(question: "Which art movement rejected logic and embraced chaos and absurdity?", options: ["Dadaism", "Realism", "Impressionism", "Baroque"], correctAnswer: "Dadaism"),
                    TriviaQuestion(question: "Minimalism is best described by which idea?", options: ["Highly detailed scenes", "Simplified forms and limited elements", "Emotional storytelling", "Historical accuracy"], correctAnswer: "Simplified forms and limited elements"),
                    TriviaQuestion(question: "Which movement revived classical Greek and Roman styles?", options: ["Romanticism", "Neoclassicism", "Surrealism", "Abstarct Expressionism"], correctAnswer: "Neoclassicism")
            ]),
            TriviaSubcategory(name: "Art Crimes", questions: [
                TriviaQuestion(question: "Which museum was the site of the largest art heist in history in 1990?", options: ["Louvre Museum", "Metropolitan Museum of Art", "Isabella Stewart Gardner Museum", "Tate Modern"], correctAnswer: "Isabella Stewart Gardner Museum"),
                TriviaQuestion(question: "Which famous painting was stolen from the Louvre in 1911?", options: ["The Starry Night", "The Scream", "Mona Lisa", "Girl with a Pearl Earring"], correctAnswer: "Mona Lisa"),
                TriviaQuestion(question: "What term is used for fake artworks created to deceive collectors?", options: ["Replicas", "Forgeries", "Sketches", "Drafts"], correctAnswer: "Forgeries"),
                TriviaQuestion(question: "Which Italian city is often associated with art theft due to its rich art history?", options: ["Milan", "Florence", "Naples", "Venice"], correctAnswer: "Florence")
            ]),
            TriviaSubcategory(name: "Museums", questions: [
                TriviaQuestion(question: "Which museum in New York is often called the Met?", options: ["Museum of Modern Art", "Guggenheim Museum", "Metropolitan Museum of Art", "Whitney Museum"], correctAnswer: "Metropolitan Museum of Art"),
                TriviaQuestion(question: "The British Museum is located in which city?", options: ["Dublin", "London", "Edinburgh", "Manchester"], correctAnswer: "London"),
                TriviaQuestion(question: "Which museum is home to the Mona Lisa?", options: ["British Museum", "Prado Museum", "Louvre Museum", "The National Gallery Museum"], correctAnswer: "Louvre Museum"),
                TriviaQuestion(question: "Which museum is famous for its glass pyramid entrance?", options: ["British Museum", "Louvre Museum", "Vatican Museums", "Prado Museum"], correctAnswer: "Louvre Museum")
            ]),
            TriviaSubcategory(name: "Terminology", questions: [
                TriviaQuestion(question: "What does Fresco mean?", options: ["Painting on dry canvas", "Painting on wet plaster", "Painting with oils", "Painting on glass"], correctAnswer: "Painting on wet plaster"),
                TriviaQuestion(question: "What is Perspective in art?", options: ["Use of color only", "Creating depth and space", "Mixing materials", "Carving technique"], correctAnswer: "Creating depth and space"),
                TriviaQuestion(question: "What does Medium refer to?", options: ["The size of artwork", "The materials used to create art", "The price of art", "The artist's mood"], correctAnswer: "The materials used to create art"),
                TriviaQuestion(question: "What is Composition in art?", options: ["The cost of artwork", "The arrangmenet of elements", "The artist's biography", "The frame style"], correctAnswer: "The arrangmenet of elements")
            ])
        ]),
    
    // ------------------ Lifestyle ------------------
        TriviaCategory(name: "Lifestyle", imageName: "Lifestyle", subcategories: [
            TriviaSubcategory(name: "Home", questions: [
                TriviaQuestion(question: "Which energy-efficient lighting option has largely replaced incandescent bulbs?", options: ["Fluorescent", "LED", "Halogen", "Neon"], correctAnswer: "LED"),
                TriviaQuestion(question: "What is a loft in home design?", options: ["A storage unit", "A raised open living space", "A type of window", "A built-in cabinet"], correctAnswer: "A raised open living space"),
                TriviaQuestion(question: "Which home system controls heating and cooling?", options: ["Plumbing", "HVAC", "Electrical wiring", "Security system"], correctAnswer: "HVAC"),
                TriviaQuestion(question: "What is the term for a room primarily used for cooking in a house?", options: ["Living room", "Kitchen", "Bathroom", "Bedroom"], correctAnswer: "Kitchen")
            ]),
                TriviaSubcategory(name: "Garden", questions: [
                    TriviaQuestion(question: "Which gardening technique involves growing plants without soil?", options: ["Hydroponics", "Mulching", "Aeration", "Crop rotation"], correctAnswer: "Hydroponics"),
                    TriviaQuestion(question: "Which type of plant lives for more than two years?", options: ["Annual", "Biennial", "Perennial", "Seasonal"], correctAnswer: "Perennial"),
                    TriviaQuestion(question: "Which flower is traditionally associated with spring and bulbs?", options: ["Tulip", "Rose", "Sunflower", "Daisy"], correctAnswer: "Tulip"),
                    TriviaQuestion(question: "Which garden tool is used to dig small holes for planting seeds or bulbs?", options: ["Rake", "Trowel", "Hoe", "Shovel"], correctAnswer: "Trowel")
            ]),
            TriviaSubcategory(name: "Hobbies", questions: [
                TriviaQuestion(question: "Which hobby involves observing and identifying birds in their natural habitat?", options: ["Hiking", "Birdwatching", "Fishing", "Gardening"], correctAnswer: "Birdwatching"),
                TriviaQuestion(question: "What hobby involves shaping clay into functional or decorative objects?", options: ["Pottery", "Sculpting", "Painting", "Jewelry making"], correctAnswer: "Pottery"),
                TriviaQuestion(question: "Which hobby involves climbing, hiking, or exploring mountains?", options: ["Running", "Mountaineering", "Yoga", "Cycling"], correctAnswer: "Mountaineering"),
                TriviaQuestion(question: "Which hobby involves decorating a surface with paint, ink, or other media?", options: ["Sculpting", "Painting", "Photography", "Origami"], correctAnswer: "Painting")
            ]),
            TriviaSubcategory(name: "Health", questions: [
                TriviaQuestion(question: "Which nutrient is essential for building and repairing muscles?", options: ["Carbohydrates", "Protein", "Fat", "Fiber"], correctAnswer: "Protein"),
                TriviaQuestion(question: "Which vitamin is primarily obtained from sunlight?", options: ["Vitamin A", "Vitamin B12", "Vitamin C", "Vitamin D"], correctAnswer: "Vitamin D"),
                TriviaQuestion(question: "Which mineral is essential for strong bones and teeth?", options: ["Iron", "Calcium", "Zinc", "Magnesium"], correctAnswer: "Calcium"),
                TriviaQuestion(question: "Which vitamin is important for immune system support?", options: ["Vitamin A", "Vitamin B12", "Vitamin C", "Vitamin K"], correctAnswer: "Vitamin C")
            ]),
            TriviaSubcategory(name: "Fashion", questions: [
                TriviaQuestion(question: "Which fabric is made from the fibers of the flax plant?", options: ["Silk", "Cotton", "Linen", "Wool"], correctAnswer: "Linen"),
                TriviaQuestion(question: "Which Italian brand is known for its luxury leather handbags and accessories?", options: ["Prada", "Versace", "Gucci", "Fendi"], correctAnswer: "Gucci"),
                TriviaQuestion(question: "Which material is primarily used in making denim jeans?", options: ["Cotton", "Wool", "Linen", "Polyester"], correctAnswer: "Cotton"),
                TriviaQuestion(question: "What does the fashion term silhouette refer to?", options: ["The color of a garment", "The outline or shape of clothing", "The fabric texture", "The stitching technique"], correctAnswer: "The outline or shape of clothing")
            ])
        ]),
    
    // ------------------ Famous Quotes ------------------
        TriviaCategory(name: "Famous Quotes", imageName: "Famous Quotes", subcategories: [
            TriviaSubcategory(name: "Celebrities", questions: [
                TriviaQuestion(question: "Which celebrity said, Life is what happens when you're busy making other plans?", options: ["John Lennon", "Paul McCartney", "Bob Dylan", "Elton John"], correctAnswer: "John Lennon"),
                TriviaQuestion(question: "Who said, Float like a butterfly, sting like a bee?", options: ["Mike Tyson", "Muhammad Ali", "Evander Holyfield", "Joe Frazier"], correctAnswer: "Muhammad Ali"),
                TriviaQuestion(question: "Which actress said, I'll never let anybody tell me who I am?", options: ["Audrey Hepburn", "Marilyn Monroe", "Lady Gaga", "Emma Watson"], correctAnswer: "Lady Gaga"),
                TriviaQuestion(question: "Who said, I'm not afraid of dying, I'm afraid of not trying?", options: ["Michael Jordan", "Madonna", "Jay-Z", "Jennifer Aniston"], correctAnswer: "Michael Jordan")
            ]),
                TriviaSubcategory(name: "Literary", questions: [
                    TriviaQuestion(question: "Who wrote, It was the best of times, it was the worst of times?", options: ["William Shakespeare", "Charles Dickens", "Jane Austen", "Mark Twain"], correctAnswer: "Charles Dickens"),
                    TriviaQuestion(question: "Who wrote, Not all those who wander are lost?", options: ["J.K. Rowling", "J.R.R. Tolkien", "C.S. Lewis", "George R.R. Martin"], correctAnswer: "J.R.R. Tolkien"),
                    TriviaQuestion(question: "All that glitters is not gold is a quote from which literary work?", options: ["Hamlet", "Macbeth", "The Merchant of Venice", "Othello"], correctAnswer: "The Merchant of Venice"),
                    TriviaQuestion(question: "Who wrote, We are all in the gutter, but some of us are looking at the stars?", options: ["Oscar Wilde", "William Shakespeare", "T.S. Eliot", "Robert Browning"], correctAnswer: "Oscar Wilde")
            ]),
            TriviaSubcategory(name: "Historical", questions: [
                TriviaQuestion(question: "Who said, The only thing we have to fear is fear itself?", options: ["Abraham Lincoln", "Franklin D. Roosevelt", "Theodore Roosevelt", "Martin Luther King Jr."], correctAnswer: "Franklin D. Roosevelt"),
                TriviaQuestion(question: "Who said, I came, I saw, I conquered?", options: ["Julius Caesar", "Alexander the Great", "Napoleon Bonaparte", "Genghis Khan"], correctAnswer: "Julius Caesar"),
                TriviaQuestion(question: "Which civil rights leader said, I have a dream?", options: ["Malcolm X", "Martin Luther King Jr.", "Nelson Mandela", "Rosa Parks"], correctAnswer: "Martin Luther King Jr."),
                TriviaQuestion(question: "Who famously said, Mr. Gorbachev, tear down this wall?", options: ["Ronald Reagan", "Jimmy Carter", "George H.W. Bush", "Bill Clinton"], correctAnswer: "Ronald Reagan")
            ]),
            TriviaSubcategory(name: "Movie", questions: [
                TriviaQuestion(question: "I'll be back is a famous quote from which movie?", options: ["Predator", "Terminator", "Total Recall", "RoboCop"], correctAnswer: "Terminator"),
                TriviaQuestion(question: "Who said, You can't handle the truth?", options: ["Tom Cruise", "Jack Nicholson", "Al Pacino", "Robert De Niro"], correctAnswer: "Jack Nicholson"),
                TriviaQuestion(question: "Which movie has the line, I'm the king of the world?", options: ["Titanic", "The Lion King", "Gladiator", "Braveheart"], correctAnswer: "Titanic"),
                TriviaQuestion(question: "Who says, Houston, we have a problem?", options: ["Tom Hanks", "Kevin Bacon", "Bill Paxton", "Ed Harris"], correctAnswer: "Tom Hanks")
            ]),
            TriviaSubcategory(name: "Philosophical", questions: [
                TriviaQuestion(question: "The unexamined life is not worth living was said by whom?", options: ["Plato", "Socrates", "Confucius", "Marcus Aurelius"], correctAnswer: "Socrates"),
                TriviaQuestion(question: "Who wrote, Man is the measure of all things?", options: ["Aristotle", "Protagoras", "Plato", "Epicurus"], correctAnswer: "Protagoras"),
                TriviaQuestion(question: "Happiness is not an ideal of reason, but of imagination is by which philosopher?", options: ["Immanuel Kant", "John Locke", "Baruch Spinoza", "David Hume"], correctAnswer: "Immanuel Kant"),
                TriviaQuestion(question: "Knowing yourself is the beginning of all wisdom was said by whom?", options: ["Socrates", "Plato", "Aristotle", "Epicurus"], correctAnswer: "Aristotle")
            ])
        ]),
    
    // ------------------ Kids ------------------
        TriviaCategory(name: "Kids", imageName: "Kids", subcategories: [
            TriviaSubcategory(name: "School", questions: [
                TriviaQuestion(question: "Which subject teaches about numbers, addition, and subtraction?", options: ["Science", "History", "Math", "Art"], correctAnswer: "Math"),
                TriviaQuestion(question: "Which subject teaches about plants, animals, and the natural world?", options: ["Geography", "Science", "Math", "Music"], correctAnswer: "Science"),
                TriviaQuestion(question: "What is the name of a book that has definitions of words?", options: ["Atlas", "Dictionary", "Novel", "Textbook"], correctAnswer: "Dictionary"),
                TriviaQuestion(question: "Which subject teaches about countries, maps, and the Earth?", options: ["Geography", "Art", "Math", "Science"], correctAnswer: "Geography")
            ]),
                TriviaSubcategory(name: "Riddles", questions: [
                    TriviaQuestion(question: "I'm tall when I'm young and short when I'm old, what am I?", options: ["Tree", "Candle", "Pencil", "Balloon"], correctAnswer: "Candle"),
                    TriviaQuestion(question: "What has keys but can't open locks?", options: ["Piano", "Map", "Door", "Treasure chest"], correctAnswer: "Piano"),
                    TriviaQuestion(question: "What has a face and two hands but no arms or legs?", options: ["Clock", "Robot", "Doll", "Mirror"], correctAnswer: "Clock"),
                    TriviaQuestion(question: "What can travel around the world while staying in a corner?", options: ["Airplane", "Postcard", "Stamp", "Kite"], correctAnswer: "Stamp")
            ]),
            TriviaSubcategory(name: "Books", questions: [
                TriviaQuestion(question: "What kind of animal is Charlotte in Charlotte's Web?", options: ["Pig", "Spider", "Horse", "Dog"], correctAnswer: "Spider"),
                TriviaQuestion(question: "What kind of creature is Hedwig in the Harry Potter books?", options: ["Cat", "Owl", "Rat", "Dragon"], correctAnswer: "Owl"),
                TriviaQuestion(question: "In The Very Hungry Caterpillar, what does the caterpillar become?", options: ["Butterfly", "Moth", "Frog", "Bird"], correctAnswer: "Butterfly"),
                TriviaQuestion(question: "In Matilda, who is the cruel headmistress of the school?", options: ["Miss Honey", "Miss Trunchbull", "Miss Piggy", "Miss Frizzle"], correctAnswer: "Miss Trunchbull")
            ]),
            TriviaSubcategory(name: "Urban Legends", questions: [
                TriviaQuestion(question: "Bigfoot is also known by what other name?", options: ["Sasquatch", "Yeti", "Chupacabra", "Slender Man"], correctAnswer: "Sasquatch"),
                TriviaQuestion(question: "What is the creature's name that is said to live in Loch Ness, Scotland?", options: ["Mothman", "Nessie", "Bigfoot", "Slender Man"], correctAnswer: "Nessie"),
                TriviaQuestion(question: "What kind of creature is said to roam forests and leave huge footprints?", options: ["Cupacabra", "Jersey Devil", "Bigfoot", "Mothman"], correctAnswer: "Bigfoot"),
                TriviaQuestion(question: "Which legend involves a mysterious creature seen near Point Pleasant, West Virgina?", options: ["Bigfoot", "Mothman", "Nessie", "Jersey Devil"], correctAnswer: "Mothman")
            ]),
            TriviaSubcategory(name: "Pets", questions: [
                TriviaQuestion(question: "Which animal is known as man's best friend?", options: ["Cat", "Dog", "Hamster", "Rabbit"], correctAnswer: "Dog"),
                TriviaQuestion(question: "Which pet is known for storing food in its cheeks?", options: ["Rabbit", "Dog", "Hamster", "Cat"], correctAnswer: "Hamster"),
                TriviaQuestion(question: "Which pet has a shell for protection?", options: ["Turtle", "Cat", "Dog", "Hamster"], correctAnswer: "Turtle"),
                TriviaQuestion(question: "Which pet enjoys burrowing and sleeping tunnels?", options: ["Dog", "Cat", "Hamster", "Parrot"], correctAnswer: "Hamster")
                ])
            ])]

// @@@@@@@@@@@@@@@@@@@@@
// SUDDEN TRIVIA QUESTIONS
// @@@@@@@@@@@@@@@@@@@@@

let suddenTriviaQuestions: [TriviaQuestion] = [
    // ------------------ Entertainment ------------------
    TriviaQuestion(
        question: "What color is the original PlayStation logo's P?",
        options: ["Red","Yellow","Green","Blue"],
        correctAnswer: "Red"
    ),
    TriviaQuestion(
        question: "Live Aid was a benefit concert in 1985, played in London and Philadelphia simultaneously, which artist performed at both venues?",
        options: ["Phil Collins","Eric Clapton","David Bowie","Queen"],
        correctAnswer: "Phil Collins"
    ),
    TriviaQuestion(
        question: "In Chinatown (1974), what seemingly mundane item does Jake Gittes find in the saltwater pond that becomes a crucial piece of evidence?",
        options: ["A watch","A pair of sunglasses","A wedding ring","A fountain pen"],
        correctAnswer: "A pair of sunglasses"
    ),
    TriviaQuestion(
        question: "What is the registry number of the USS Enterprise in Star Trek: The Original Series?",
        options: ["NCC-1701","NCC-1764","NCC-1031","NCC-74656"],
        correctAnswer: "NCC-1701"
    ),
    TriviaQuestion(
        question: "In the 1985 NBA Draft, who was selected before Michael Jordan?",
        options: ["Hakeem and Sam Bowie","Patrick Ewing and Chris Mullin","Charles Barkley and John Stockton","Karl Malone and Clyde Drexler"],
        correctAnswer: "Hakeem and Sam Bowie"
    ),
    
    // ------------------ Useless Facts ------------------
    TriviaQuestion(
        question: "What color is Coca-Cola before food coloring is added?",
        options: ["Clear","Brown","Green","Yellow"],
        correctAnswer: "Yellow"
    ),
    TriviaQuestion(
        question: "Why do teens often prefer texting over talking face-to-face?",
        options: ["It feels less emotionally intense","It’s faster","It gives them more control","All of the above"],
        correctAnswer: "All of the above"
    ),
    TriviaQuestion(
        question: "Which tool was so valuable in ancient times that it was sometimes buried?",
        options: ["Hammer","Chiesel","Axe","Saw"],
        correctAnswer: "Axe"
    ),
    TriviaQuestion(
        question: "Which Detroit landmark was the first major roadway in the world paved entirely with concrete?",
        options: ["Woodward Ave","Jefferson Avenue","Grand River Avenue","Michigan Ave"],
        correctAnswer: "Woodward Ave"
    ),
    TriviaQuestion(
        question: "Which global company was nearly named Cadabra before changing its name?",
        options: ["Apple","Amazon","Alibaba","eBay"],
        correctAnswer: "Amazon"
    ),

    // ------------------ Food & Drink ------------------
    TriviaQuestion(
        question: "Which restaurant is famous for its endless pancakes promotion?",
        options: ["Denny’s","IHOP","Cracker Barrel","Perkins"],
        correctAnswer: "IHOP"
    ),
    TriviaQuestion(
        question: "Which fountain drink originated in Waco, Texas?",
        options: ["Dr. Pepper","Big Red","Root Beer","Mr. Pibb"],
        correctAnswer: "Dr. Pepper"
    ),
    TriviaQuestion(
        question: "What is zesting?",
        options: ["Juicing fruit","Removing the outer peel of citrus fruit","Drying herbs","Adding spices"],
        correctAnswer: "Removing the outer peel of citrus fruit"
    ),
    TriviaQuestion(
        question: "What fast-food chain is known for its secret menu animal-style items?",
        options: ["Five Guys","Shake Shack","In-N-Out Burger","Whataburger"],
        correctAnswer: "In-N-Out Burger"
    ),
    TriviaQuestion(
        question: "Which chocolate brand is known for producing ultra-luxury, hand crafted chocolates?",
        options: ["Lindt","Godiva","La Madeline au Truffe","Ferrero Rocher"],
        correctAnswer: "La Madeline au Truffe"
    ),

    // ------------------ Geographic ------------------
    TriviaQuestion(
        question: "What city is built on more than 100 islands connected by bridges?",
        options: ["Copenhagen","Helsinki","Stockholm","Oslo"],
        correctAnswer: "Stockholm"
    ),
    TriviaQuestion(
        question: "Which school is located in Ithaca, New York?",
        options: ["Syracuse University","University at Buffalo","Cornell University","Colgate University"],
        correctAnswer: "Cornell University"
    ),
    TriviaQuestion(
        question: "Which country is both in Europe and Asia?",
        options: ["Greece","Turkey","Italy","Bulgaria"],
        correctAnswer: "Turkey"
    ),
    TriviaQuestion(
        question: "Which U.S. state has the highest population?",
        options: ["Texas","New York","Florida","California"],
        correctAnswer: "California"
    ),
    TriviaQuestion(
        question: "Which language is mainly spoken in South Korea?",
        options: ["Japanese","Mandarin","Korean","Vietnamese"],
        correctAnswer: "Korean"
    ),
    
    // ------------------ General ------------------
    TriviaQuestion(
        question: "Which celebrity couple is known by the nickname Bennifer?",
        options: ["Brad Pitt & Angelina Jolie", "Justin Bieber & Hailey Bieber", "Ben Affleck & Jennifer Lopez", "Ryan Reynolds & Blake Lively"],
        correctAnswer: "Ben Affleck & Jennifer Lopez"
    ),
    TriviaQuestion(
        question: "Which marine animal is known for its intelligence and ability to use tools?",
        options: ["Shark", "Dolphin", "Octopus", "Whale"],
        correctAnswer: "Octopus"
    ),
    TriviaQuestion(
        question: "Which superhero is known for the phrase I am Groot?",
        options: ["Rocket Raccoon", "Hulk", "Thor", "Groot"],
        correctAnswer: "Groot"
    ),
    TriviaQuestion(
        question: "In which year did the French Revolution begin?",
        options: ["1776", "1789", "1804", "1812"],
        correctAnswer: "1789"
    ),
    TriviaQuestion(
        question: "Which holiday celebrates the end of fasting during Ramadan?",
        options: ["Eid al-Adha", "Mawlid", "Eid al-Fitr", "Ashura"],
        correctAnswer: "Eid al-Fitr"
        ),
    
    // ------------------ Science ------------------
    TriviaQuestion(
        question: "Which theory suggests that a small group of elites holds the most power in society?",
        options: ["Pluralism", "Elitism", "Populism", "Federalism"],
        correctAnswer: "Elitism"
    ),
    TriviaQuestion(
        question: "What is the term for a law passed by a legislative body?",
        options: ["Constiution", "Statute", "Precedent", "Ordinance"],
        correctAnswer: "Statute"
    ),
    TriviaQuestion(
        question: "Which planet is known for having extreme winds and a blue appearance?",
        options: ["Neptune", "Earth", "Saturn", "Jupiter"],
        correctAnswer: "Neptune"
    ),
    TriviaQuestion(
        question: "Which type of blood cells help fight infections?",
        options: ["Red Blood Cells", "White Blood Cells", "Platelets", "Plasma"],
        correctAnswer: "White Blood Cells"
    ),
    TriviaQuestion(
        question: "Which element is most abundant in Earth's crust?",
        options: ["Oxygen", "Silicon", "Aluminum", "Iron"],
        correctAnswer: "Oxygen"
    ),
    
    // ------------------ Travel ------------------
    TriviaQuestion(
        question: "Which type of bike is ideal for carrying luggage on trips?",
        options: ["BMX Bike", "Road Bike", "Touring Bike", "Mountain Bike"],
        correctAnswer: "Touring Bike"
    ),
    TriviaQuestion(
        question: "What type of road is designed for high-speed traffic?",
        options: ["Boulevard", "Freeway", "Alley", "Street"],
        correctAnswer: "Freeway"
    ),
    TriviaQuestion(
        question: "What instrument is primarily used to measure an aircraft's altitude?",
        options: ["Compass", "Altimeter", "Airspeed Indicator", "Gyroscope"],
        correctAnswer: "Altimeter"
    ),
    TriviaQuestion(
        question: "Which U.S. city operates the largest light rail system by route length?",
        options: ["Los Angeles", "Dallas", "San Francisco", "Boston"],
        correctAnswer: "Dallas"
    ),
    TriviaQuestion(
        question: "What type of shoes is recommended for long-distance walking and trekking?",
        options: ["Flip-flops", "Running shoes", "Hiking boots", "Dress shoes"],
        correctAnswer: "Hiking boots"
    ),
    
    // ------------------ Technology ------------------
    TriviaQuestion(
        question: "What is the purpose of Airplane Mode on a smartphone?",
        options: ["Improve battery life only", "Disable all wireless communications", "Boost signal strength", "Enable GPS tracking"],
        correctAnswer: "Disable all wireless communications"
    ),
    TriviaQuestion(
        question: "Which storage device has no moving parts?",
        options: ["HDD", "SSD", "CD-ROM", "Floppy Disk"],
        correctAnswer: "SSD"
    ),
    TriviaQuestion(
        question: "Which company created the Internet Explorer browser?",
        options: ["Apple", "Netscape", "Microsoft", "IBM"],
        correctAnswer: "Microsoft"
    ),
    TriviaQuestion(
        question: "Which person founded Instagram?",
        options: ["Evan Spiegel", "Kevin Systrom", "Mark Cuban", "Reid Hoffman"],
        correctAnswer: "Kevin Systrom"
    ),
    TriviaQuestion(
        question: "What does BIOS stand for?",
        options: ["Basic Input Output System", "Binary Integrated Operating Setup", "Basic Internal Operating Software", "Built-In Opearting System"],
        correctAnswer: "Basic Input Output System"
    ),
    
    // ------------------ Art ------------------
    TriviaQuestion(
        question: "Who painted The Birth of Venus?",
        options: ["Leonardo da Vinci", "Michelangelo", "Sandro Botticelli", "Raphael"],
        correctAnswer: "Sandro Botticelli"
    ),
    TriviaQuestion(
        question: "Which movement is associated with dreamlike imagery?",
        options: ["Realism", "Surrealism", "Romanticism", "Neoclassicism"],
        correctAnswer: "Surrealism"
    ),
    TriviaQuestion(
        question: "Which law enforcement organization maintains a stolen art database worldwide?",
        options: ["FBI only", "Interpol", "NASA", "UNESCO"],
        correctAnswer: "Interpol"
    ),
    TriviaQuestion(
        question: "The Prado Museum is located in which country?",
        options: ["Italy", "Spain", "Portugal", "France"],
        correctAnswer: "Spain"
    ),
    TriviaQuestion(
        question: "What does Canvas refer to?",
        options: ["A type of brush", "A painting surface", "A color palette", "A sculpture tool"],
        correctAnswer: "A painting surface"
    ),
    
    // ------------------ Lifestyle ------------------
    TriviaQuestion(
        question: "Which type of flooring is made by pressing together layers of wood veneer?",
        options: ["Laminate", "Hardwood", "Tile", "Carpet"],
        correctAnswer: "Laminate"
    ),
    TriviaQuestion(
        question: "Which insect is considered beneficial for pollinating garden plants?",
        options: ["Aphids", "Ladybugs", "Bees", "Grasshoppers"],
        correctAnswer: "Bees"
    ),
    TriviaQuestion(
        question: "Which hobby focuses on folding paper into artistic shapes?",
        options: ["Scrapbooking", "Origami", "Calligraphy", "Weaving"],
        correctAnswer: "Origami"
    ),
    TriviaQuestion(
        question: "Which nutrient is the main source of energy for the body?",
        options: ["Protein", "Fat", "Carbohydrates", "Vitamins"],
        correctAnswer: "Carbohydrates"
    ),
    TriviaQuestion(
        question: "What is the fashion term for clothing inspired by previous decades?",
        options: ["Capsule collection", "Vintage", "Couture", "Fast fashion"],
        correctAnswer: "Vintage"
    ),
    
    // ------------------ Famous Quotes ------------------
    TriviaQuestion(
        question: "Which celebrity said, Don't dream your life, live your dream?",
        options: ["Dolly Parton", "Ellen DeGeneres", "Will Smith", "Oprah Winfrey"],
        correctAnswer: "Oprah Winfrey"
    ),
    TriviaQuestion(
        question: "Which author wrote, You never really understand a person until you consider things from his point of view?",
        options: ["Mark Twain", "Harper Lee", "J.D. Salinger", "F. Scott Fitzgerald"],
        correctAnswer: "Harper Lee"
    ),
    TriviaQuestion(
        question: "Speak softly and carry a big stick is a quote from which U.S. President?",
        options: ["Theodore Roosevelt", "Woodrow Wilson", "Franklin D. Roosevelt", "Abraham Lincoln"],
        correctAnswer: "Theodore Roosevelt"
    ),
    TriviaQuestion(
        question: "Which film features, Say hello to my little friend?",
        options: ["Scarface", "Casino", "Heat", "Goodfellas"],
        correctAnswer: "Scarface"
    ),
    TriviaQuestion(
        question: "Who wrote, Happiness is the highest good?",
        options: ["Aristotle", "Epicurus", "Stoics", "Plato"],
        correctAnswer: "Aristotle"
    ),
    
    // ------------------ Kids ------------------
    TriviaQuestion(
        question: "What do students usually bring their homework in?",
        options: ["Pencil case", "Backpack", "Binder", "Folder"],
        correctAnswer: "Backpack"
    ),
    TriviaQuestion(
        question: "What has a neck but no head?",
        options: ["Bottle", "Guitar", "Shirt", "Vase"],
        correctAnswer: "Bottle"
    ),
    TriviaQuestion(
        question: "In Green Eggs and Ham, who refuses to eat the green eggs and ham at first?",
        options: ["Sam-I-Am", "The narrator", "Horton", "Max"],
        correctAnswer: "The narrator"
    ),
    TriviaQuestion(
        question: "Which legend says if you chant her name three times in front of a mirror, she appears?",
        options: ["La Llorona", "Slender Man", "Bloody Mary", "Bigfoot"],
        correctAnswer: "Bloody Mary"
    ),
    TriviaQuestion(
        question: "Which pet can change color to hide or blend in with its surroundings?",
        options: ["Dog", "Fish", "Chameleon", "Rabbit"],
        correctAnswer: "Chameleon"
    )
]



