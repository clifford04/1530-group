// acts as the database for the application
// contains the albums in the database as well as other user's ratings/reviews
// user data is also here and gets updated as user makes reviews and adds friends

import 'package:mvvm_flutter/models/friends.dart';

List<String> friends = List.empty(growable: true);
List<Map<String, int>> users_ratings = List.empty(growable: true);
List<Map<String, String>> users_reviews = List.empty(growable: true);

List<Map<String, List<Map<String, int>>>> friends_ratings = [
  {
    "Steve": [
      {"1989 (Taylor's Version)": 5},
      {"Red (Taylor's Version)": 5},
      {"Voicenotes": 4},
    ]
  },
  {
    "Rachel": [
      {"After Hours": 4},
      {"The Eminem Show": 5},
      {"Midnight Memories (The Ultimate Edition)": 4},
    ]
  },
  {
    "James": [
      {"thank u, next": 4},
      {"Sweetener": 5},
      {"Birds in the Trap Sing McKnight": 3},
    ]
  },
  {
    "Sophia": [
      {"Astroworld": 4},
      {"Origins": 5},
      {"Evolve": 5},
    ]
  },
  {
    "Liam": [
      {"Maroon Five": 4},
      {"Autumn Variations": 4},
      {"Uptown Funk": 5},
    ]
  },
  {
    "Emma": [
      {"Doo-Wops & Hooligans": 4},
      {"1989 (Taylor's Version)": 4},
      {"Red (Taylor's Version)": 5},
    ]
  },
  {
    "Ethan": [
      {"Voicenotes": 3},
      {"After Hours": 4},
      {"The Eminem Show": 5},
    ]
  },
  {
    "Olivia": [
      {"Midnight Memories (The Ultimate Edition)": 5},
      {"thank u, next": 4},
      {"Sweetener": 4},
    ]
  },
  {
    "Noah": [
      {"Birds in the Trap Sing McKnight": 5},
      {"Astroworld": 4},
      {"Origins": 4},
    ]
  },
  {
    "Ava": [
      {"Evolve": 5},
      {"Maroon Five": 3},
      {"Autumn Variations": 4},
    ]
  },
  {
    "Mason": [
      {"Uptown Funk": 5},
      {"Doo-Wops & Hooligans": 5},
      {"1989 (Taylor's Version)": 4},
    ]
  },
  {
    "Isabella": [
      {"Red (Taylor's Version)": 4},
      {"Voicenotes": 5},
      {"After Hours": 4},
    ]
  },
  {
    "Jacob": [
      {"The Eminem Show": 4},
      {"Midnight Memories (The Ultimate Edition)": 5},
      {"thank u, next": 3},
    ]
  },
  {
    "Mia": [
      {"Sweetener": 4},
      {"Birds in the Trap Sing McKnight": 5},
      {"Astroworld": 5},
    ]
  },
  {
    "Lucas": [
      {"Origins": 4},
      {"Evolve": 4},
      {"Maroon Five": 5},
    ]
  },
  {
    "Amelia": [
      {"Autumn Variations": 4},
      {"Uptown Funk": 4},
      {"Doo-Wops & Hooligans": 5},
    ]
  }
];

List<Map<String, List<Map<String, String>>>> friends_reviews = [
  {
    "Steve": [
      {"1989 (Taylor's Version)": "love this"},
      {"Red (Taylor's Version)": "amazing"},
      {"Voicenotes": "wow"},
    ]
  },
  {
    "Rachel": [
      {"After Hours": "awesome"},
      {"The Eminem Show": "i <3 eminem"},
      {"Midnight Memories (The Ultimate Edition)": "no words"},
    ]
  },
  {
    "James": [
      {"thank u, next": "this is my favorite"},
      {"Sweetener": "love ariana"},
      {"Birds in the Trap Sing McKnight": "yassss"},
    ]
  },
  {
    "Sophia": [
      {"Astroworld": "omg so good"},
      {"Origins": "loveeee"},
      {"Evolve": "spectacular"},
    ]
  },
  {
    "Liam": [
      {"Maroon Five": "amazing"},
      {"Autumn Variations": "such a great listening experience"},
      {"Uptown Funk": "love me some funk"},
    ]
  },
  {
    "Emma": [
      {"Doo-Wops & Hooligans": "love"},
      {"1989 (Taylor's Version)": "i'm taylors number 1 fan"},
      {"Red (Taylor's Version)": "iconic"},
    ]
  },
  {
    "Ethan": [
      {"Voicenotes": "i can listen to this forever"},
      {"After Hours": "love"},
      {"The Eminem Show": "can't get over"},
    ]
  },
  {
    "Olivia": [
      {"Midnight Memories (The Ultimate Edition)": "amazing"},
      {"thank u, next": "love this"},
      {"Sweetener": "wow"},
    ]
  },
  {
    "Noah": [
      {"Birds in the Trap Sing McKnight": "awesome"},
      {"Astroworld": "love"},
      {"Origins": "my fav"},
    ]
  },
  {
    "Ava": [
      {"Evolve": "yessss"},
      {"Maroon Five": "just okay"},
      {"Autumn Variations": "so relaxing"},
    ]
  },
  {
    "Mason": [
      {"Uptown Funk": "my comfort song"},
      {"Doo-Wops & Hooligans": "so silly"},
      {"1989 (Taylor's Version)": "an experience"},
    ]
  },
  {
    "Isabella": [
      {"Red (Taylor's Version)": "wow"},
      {"Voicenotes": "amazing"},
      {"After Hours": "love this"},
    ]
  },
  {
    "Jacob": [
      {"The Eminem Show": "eminem is king"},
      {"Midnight Memories (The Ultimate Edition)": "awesome"},
      {"thank u, next": "not my fav"},
    ]
  },
  {
    "Mia": [
      {"Sweetener": "wow"},
      {"Birds in the Trap Sing McKnight": "spectacular"},
      {"Astroworld": "can't get enough"},
    ]
  },
  {
    "Lucas": [
      {"Origins": "wow"},
      {"Evolve": "awesome"},
      {"Maroon Five": "yesss"},
    ]
  },
  {
    "Amelia": [
      {"Autumn Variations": "eh"},
      {"Uptown Funk": "love bruno mars"},
      {"Doo-Wops & Hooligans": "the best"},
    ]
  }
];
