// code to fetch an album given a keyword
// code to fetch an album's details given its id

import 'package:mvvm_flutter/models/album.dart';
import 'package:mvvm_flutter/models/album_details.dart';
import 'package:mvvm_flutter/constants.dart';


class Webservice {
  // predefined list of albums
  // songs and songDetails from database
  final _albums = songs;
  final _albumDetails = songDetails;

  // Album from album.dart
  Future<List<Album>> fetchAlbums(String keyword) async {
    // filter albums based on the keyword
    final filteredAlbums = _albums.where((album) {
      return album["Title"].toLowerCase().contains(keyword.toLowerCase());
    }).toList();

    return filteredAlbums.map((album) => Album.fromJson(album)).toList();
  }


  // AlbumDetails from album_details.dart
  Future<AlbumDetails> fetchAlbumDetails(String iD) async {
    // fetch album details based on the iD
    final details = _albumDetails[iD];
    if (details != null) {
      return AlbumDetails.fromJson(details);
    } else {
      throw Exception("Album details not found!");
    }
  }
}