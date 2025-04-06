// getters for the album details

import 'package:mvvm_flutter/models/album_details.dart';

class AlbumDetailsViewModel {
  final AlbumDetails albumDetails;

  AlbumDetailsViewModel({required this.albumDetails});

  String get title {
    return this.albumDetails.title ?? "Unknown Title";
  }

  String get cover {
    return this.albumDetails.cover ?? "https://example.com/placeholder.jpg";
  }

  String get writer {
    return this.albumDetails.writer ?? "Unknown Writer";
  }

  String get details {
    return this.albumDetails.details ?? "N/A";
  }
}
