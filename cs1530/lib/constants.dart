// acts as the database for the application
// contains the albums in the database as well as other user's ratings/reviews
// user data is also here and gets updated as user makes reviews and adds friends

import 'package:mvvm_flutter/models/friends.dart';

List<String> friends = List.empty(growable: true);
List<Map<String, int>> users_ratings = List.empty(growable: true);
List<Map<String, String>> users_reviews = List.empty(growable: true);
List<String> friends = List.empty(growable: true);

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

Map<String, dynamic> songDetails = {
  "ts1989tv": {
    "Title": "1989 (Taylor's Version)",
    "Year": "2023",
    "Released": "October 27, 2023",
    "Runtime": "77 min",
    "Genre": "Pop",
    "Writer": "Taylor Swift",
    "Details": "Re-recorded version of her 2014 pop album with vault tracks.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Multiple chart-topping hits",
    "Cover": "assets/album1.jpg"
  },
  "tsredtv": {
    "Title": "Red (Taylor's Version)",
    "Year": "2021",
    "Released": "November 12, 2021",
    "Runtime": "130 min",
    "Genre": "Pop, Country",
    "Writer": "Taylor Swift",
    "Details":
        "Re-recorded version of her 2012 album, includes 10-minute version of 'All Too Well'.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Grammy-nominated vault tracks",
    "Cover": "assets/album10.jpg"
  },
  "cpvoicenotes": {
    "Title": "Voicenotes",
    "Year": "2018",
    "Released": "May 11, 2018",
    "Runtime": "45 min",
    "Genre": "Pop, R&B",
    "Writer": "Charlie Puth",
    "Details": "Second studio album featuring 'Attention' and 'How Long'.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Certified Platinum",
    "Cover": "assets/album2.jpg"
  },
  "twafterhours": {
    "Title": "After Hours",
    "Year": "2020",
    "Released": "March 20, 2020",
    "Runtime": "56 min",
    "Genre": "Synth-pop, R&B",
    "Writer": "The Weeknd",
    "Details": "Critically acclaimed album with hits like 'Blinding Lights'.",
    "Language": "English",
    "Country": "Canada",
    "Awards": "Billboard Music Award for Top Hot 100 Song",
    "Cover": "assets/album3.jpg"
  },
  "emshow": {
    "Title": "The Eminem Show",
    "Year": "2002",
    "Released": "May 26, 2002",
    "Runtime": "77 min",
    "Genre": "Rap, Hip Hop",
    "Writer": "Eminem",
    "Details":
        "Multi-platinum, Grammy-winning album with hits like 'Without Me' and 'Cleanin' Out My Closet'.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Grammy Award for Best Rap Album",
    "Cover": "assets/album4.jpg"
  },
  "odmidnight": {
    "Title": "Midnight Memories (The Ultimate Edition)",
    "Year": "2013",
    "Released": "November 25, 2013",
    "Runtime": "65 min",
    "Genre": "Pop Rock",
    "Writer": "One Direction",
    "Details":
        "Includes global hits like 'Story of My Life' and 'Best Song Ever'.",
    "Language": "English",
    "Country": "UK",
    "Awards": "Best British Video",
    "Cover": "assets/album5.jpg"
  },
  "agthankunext": {
    "Title": "thank u, next",
    "Year": "2019",
    "Released": "February 8, 2019",
    "Runtime": "41 min",
    "Genre": "Pop, R&B",
    "Writer": "Ariana Grande",
    "Details":
        "Personal, chart-topping album with themes of self-love and growth.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Grammy-nominated",
    "Cover": "assets/album6.jpg"
  },
  "agsweetener": {
    "Title": "Sweetener",
    "Year": "2018",
    "Released": "August 17, 2018",
    "Runtime": "47 min",
    "Genre": "Pop, R&B",
    "Writer": "Ariana Grande",
    "Details": "Critically acclaimed album including 'no tears left to cry'.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Grammy Award for Best Pop Vocal Album",
    "Cover": "assets/album7.jpg"
  },
  "tsbirds": {
    "Title": "Birds in the Trap Sing McKnight",
    "Year": "2016",
    "Released": "September 2, 2016",
    "Runtime": "54 min",
    "Genre": "Hip Hop, Trap",
    "Writer": "Travis Scott",
    "Details":
        "Breakout album with features from Kendrick Lamar and Bryson Tiller.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Certified Platinum",
    "Cover": "assets/album8.jpg"
  },
  "tsastro": {
    "Title": "Astroworld",
    "Year": "2018",
    "Released": "August 3, 2018",
    "Runtime": "58 min",
    "Genre": "Hip Hop, Trap, Psychedelic",
    "Writer": "Travis Scott",
    "Details": "Iconic album featuring the mega-hit 'Sicko Mode'.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Grammy-nominated",
    "Cover": "assets/album9.jpg"
  },
  "idorigins": {
    "Title": "Origins",
    "Year": "2018",
    "Released": "November 9, 2018",
    "Runtime": "51 min",
    "Genre": "Alternative Rock, Pop Rock",
    "Writer": "Imagine Dragons",
    "Details": "Includes hits like 'Natural' and 'Bad Liar'.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Certified Gold",
    "Cover": "assets/album11.jpg"
  },
  "idevolve": {
    "Title": "Evolve",
    "Year": "2017",
    "Released": "June 23, 2017",
    "Runtime": "43 min",
    "Genre": "Alternative Rock, Pop",
    "Writer": "Imagine Dragons",
    "Details": "Includes 'Believer', 'Thunder', and 'Whatever It Takes'.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Grammy-nominated",
    "Cover": "assets/album12.jpg"
  },
  "sjmaroonfive": {
    "Title": "Maroon Five",
    "Year": "2023",
    "Released": "2023",
    "Runtime": "3 min",
    "Genre": "Indie Pop",
    "Writer": "Spencer Jordan",
    "Details": "An emotional indie pop single reflecting on relationships.",
    "Language": "English",
    "Country": "USA",
    "Awards": "N/A",
    "Cover": "assets/album13.jpg"
  },
  "esautumn": {
    "Title": "Autumn Variations",
    "Year": "2023",
    "Released": "September 29, 2023",
    "Runtime": "47 min",
    "Genre": "Folk Pop",
    "Writer": "Ed Sheeran",
    "Details": "Personal and seasonal reflections told through acoustic melodies.",
    "Language": "English",
    "Country": "UK",
    "Awards": "N/A",
    "Cover": "assets/album14.jpg"
  },
  "mrbfunk": {
    "Title": "Uptown Funk",
    "Year": "2014",
    "Released": "November 10, 2014",
    "Runtime": "4 min",
    "Genre": "Funk, Pop",
    "Writer": "Mark Ronson, Bruno Mars",
    "Details": "Smash hit single that topped charts worldwide.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Grammy Award for Record of the Year",
    "Cover": "assets/album15.jpg"
  },
  "bmdwh": {
    "Title": "Doo-Wops & Hooligans",
    "Year": "2010",
    "Released": "October 4, 2010",
    "Runtime": "35 min",
    "Genre": "Pop, R&B",
    "Writer": "Bruno Mars",
    "Details": "Debut album with hits like 'Just the Way You Are' and 'Grenade'.",
    "Language": "English",
    "Country": "USA",
    "Awards": "Multiple Grammy nominations",
    "coverURL": "assets/album16.jpg"
  }
};

List<Map<String, dynamic>> songs = [
  {
    "Title": "1989 (Taylor's Version)",
    "Year": "2023",
    "albumID": "ts1989tv",
    "Type": "album",
    "Cover": "assets/album1.jpg"
  },
  {
    "Title": "Red (Taylor's Version)",
    "Year": "2021",
    "albumID": "tsredtv",
    "Type": "album",
    "Cover": "assets/album10.jpg"
  },
  {
    "Title": "Voicenotes",
    "Year": "2018",
    "albumID": "cpvoicenotes",
    "Type": "album",
    "Cover": "assets/album2.jpg"
  },
  {
    "Title": "After Hours",
    "Year": "2020",
    "albumID": "twafterhours",
    "Type": "album",
    "Cover": "assets/album3.jpg"
  },
  {
    "Title": "The Eminem Show",
    "Year": "2002",
    "albumID": "emshow",
    "Type": "album",
    "Cover": "assets/album4.jpg"
  },
  {
    "Title": "Midnight Memories (The Ultimate Edition)",
    "Year": "2013",
    "albumID": "odmidnight",
    "Type": "album",
    "Cover": "assets/album5.jpg"
  },
  {
    "Title": "thank u, next",
    "Year": "2019",
    "albumID": "agthankunext",
    "Type": "album",
    "Cover": "assets/album6.jpg"
  },
  {
    "Title": "Sweetener",
    "Year": "2018",
    "albumID": "agsweetener",
    "Type": "album",
    "Cover": "assets/album7.jpg"
  },
  {
    "Title": "Birds in the Trap Sing McKnight",
    "Year": "2016",
    "albumID": "tsbirds",
    "Type": "album",
    "Cover": "assets/album8.jpg"
  },
  {
    "Title": "Astroworld",
    "Year": "2018",
    "albumID": "tsastro",
    "Type": "album",
    "Cover": "assets/album9.jpg"
  },
  {
    "Title": "Origins",
    "Year": "2018",
    "albumID": "idorigins",
    "Type": "album",
    "Cover": "assets/album11.jpg"
  },
  {
    "Title": "Evolve",
    "Year": "2017",
    "albumID": "idevolve",
    "Type": "album",
    "Cover": "assets/album12.jpg"
  },
  {
    "Title": "Maroon Five",
    "Year": "2023",
    "albumID": "sjmaroonfive",
    "Type": "song",
    "Cover": "assets/album13.jpg"
  },
  {
    "Title": "Autumn Variations",
    "Year": "2023",
    "albumID": "esautumn",
    "Type": "album",
    "Cover": "assets/album14.jpg"
  },
  {
    "Title": "Uptown Funk",
    "Year": "2014",
    "albumID": "mrbfunk",
    "Type": "song",
    "Cover": "assets/album15.jpg"
  },
  {
    "Title": "Doo-Wops & Hooligans",
    "Year": "2010",
    "albumID": "bmdwh",
    "Type": "album",
    "Cover": "assets/album16.jpg"
  }
];

List<Friend> friendsVM = [
  Friend(
    name: 'Steve',
    age: 24,
    bio: 'Loves chill music.',
    favoriteAlbums: [
      "assets/album3.jpg",
      "assets/album11.jpg",
      "assets/album7.jpg"
    ],
  ),
  Friend(
    name: 'Rachel',
    age: 28,
    bio: 'Big fan of old school music.',
    favoriteAlbums: [
      "assets/album9.jpg",
      "assets/album1.jpg",
      "assets/album15.jpg"
    ],
  ),
  Friend(
    name: 'James',
    age: 22,
    bio: 'Tech enthusiast and rock lover.',
    favoriteAlbums: [
      "assets/album2.jpg",
      "assets/album10.jpg",
      "assets/album16.jpg"
    ],
  ),
  Friend(
    name: 'Sophia',
    age: 26,
    bio: 'Enjoys mysteries, thrillers, and long walks.',
    favoriteAlbums: [
      "assets/album13.jpg",
      "assets/album8.jpg",
      "assets/album6.jpg"
    ],
  ),
  Friend(
    name: 'Liam',
    age: 30,
    bio: 'Music lover and sports enthusiast.',
    favoriteAlbums: [
      "assets/album12.jpg",
      "assets/album14.jpg",
      "assets/album4.jpg"
    ],
  ),
  Friend(
    name: 'Emma',
    age: 32,
    bio: 'Passionate about yoga, nature, and indie music.',
    favoriteAlbums: [
      "assets/album5.jpg",
      "assets/album2.jpg",
      "assets/album1.jpg"
    ],
  ),
  Friend(
    name: 'Ethan',
    age: 35,
    bio: 'A foodie who loves trying new recipes.',
    favoriteAlbums: [
      "assets/album7.jpg",
      "assets/album10.jpg",
      "assets/album9.jpg"
    ],
  ),
  Friend(
    name: 'Olivia',
    age: 27,
    bio: 'Lover of books, documentaries, and traveling.',
    favoriteAlbums: [
      "assets/album6.jpg",
      "assets/album3.jpg",
      "assets/album13.jpg"
    ],
  ),
  Friend(
    name: 'Noah',
    age: 40,
    bio: 'Loves 80s music and going to vintage markets.',
    favoriteAlbums: [
      "assets/album8.jpg",
      "assets/album11.jpg",
      "assets/album15.jpg"
    ],
  ),
  Friend(
    name: 'Ava',
    age: 55,
    bio: 'Enjoys cooking, gardening, and quiet nights in.',
    favoriteAlbums: [
      "assets/album16.jpg",
      "assets/album5.jpg",
      "assets/album4.jpg"
    ],
  ),
  Friend(
    name: 'Mason',
    age: 18,
    bio: 'Fresh out of high school, into gaming and comics.',
    favoriteAlbums: [
      "assets/album1.jpg",
      "assets/album14.jpg",
      "assets/album2.jpg"
    ],
  ),
  Friend(
    name: 'Isabella',
    age: 39,
    bio: 'Loves adventure sports and nature documentaries.',
    favoriteAlbums: [
      "assets/album12.jpg",
      "assets/album6.jpg",
      "assets/album7.jpg"
    ],
  ),
  Friend(
    name: 'Jacob',
    age: 50,
    bio: 'Into photography, fine arts, and history.',
    favoriteAlbums: [
      "assets/album9.jpg",
      "assets/album10.jpg",
      "assets/album3.jpg"
    ],
  ),
  Friend(
    name: 'Mia',
    age: 33,
    bio: 'A big fan of rap music and fitness.',
    favoriteAlbums: [
      "assets/album8.jpg",
      "assets/album13.jpg",
      "assets/album5.jpg"
    ],
  ),
  Friend(
    name: 'Lucas',
    age: 60,
    bio: 'Retired and enjoying life, love old-school films.',
    favoriteAlbums: [
      "assets/album16.jpg",
      "assets/album11.jpg",
      "assets/album15.jpg"
    ],
  ),
  Friend(
    name: 'Amelia',
    age: 100,
    bio: 'A century of wisdom, enjoys jazz.',
    favoriteAlbums: [
      "assets/album4.jpg",
      "assets/album12.jpg",
      "assets/album14.jpg"
    ],
  ),
];