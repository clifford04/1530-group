// model for a friend--shown on friends page when going to follow friend

// OLIVIA

class Friend {
  final String name;
  final int age;
  final String bio;
  final List<String> favoriteAlbums; // URLs to the album covers
  bool pressed;

  // pressed refers to whether or not follow button has been pressed
  Friend({
    required this.name,
    required this.age,
    required this.bio,
    required this.favoriteAlbums,
    this.pressed = false,
  });

  void togglePressedStatus() {
    pressed = !pressed;
  }
}
