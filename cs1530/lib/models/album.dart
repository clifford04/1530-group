// class used when displaying list of albums after searching for one
// when making a review

class Album {
  final String title;
  final String coverUrl;
  final String albumID;

  Album({required this.title, required this.coverUrl, required this.albumID});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json["Title"],
      coverUrl: json["Cover"],
      albumID: json["albumID"],
    );
  }
}
