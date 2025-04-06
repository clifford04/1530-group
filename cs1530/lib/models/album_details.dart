// class used after choosing a album to review--contains all of its details
// some of these details are displayed on page that user reviews on

class AlbumDetails {
  final String title;
  final String year;
  final String released;
  final String runtime;
  final String genre;
  final String writer;
  final String details;
  final String language;
  final String country;
  final String awards;
  final String cover;

  AlbumDetails({
    required this.title,
    required this.year,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.writer,
    required this.details,
    required this.language,
    required this.country,
    required this.awards,
    required this.cover,
  });

  factory AlbumDetails.fromJson(Map<String, dynamic> json) {
    return AlbumDetails(
      title: json['Title'] ?? 'Unknown Title',
      year: json['Year'] ?? 'Unknown Year',
      released: json['Released'] ?? 'Unknown Release Date',
      runtime: json['Runtime'] ?? 'Unknown Runtime',
      genre: json['Genre'] ?? 'Unknown Genre',
      writer: json['Writer'] ?? 'Unknown Writer',
      details: json['Details'] ?? '',
      language: json['Language'] ?? 'Unknown Language',
      country: json['Country'] ?? 'Unknown Country',
      awards: json['Awards'] ?? 'No Awards',
      cover: json['Cover'] ?? 'assets/placeholder.jpg', // Default cover
    );
  }
}
