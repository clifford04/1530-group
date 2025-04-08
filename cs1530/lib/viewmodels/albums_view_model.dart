// contains getters for the albums

import 'package:mvvm_flutter/models/album.dart';

class AlbumViewModel {
  final Album album;

  AlbumViewModel({required this.album});

  String get title {
    return this.album.title;
  }

  String get cover {
    return this.album.coverUrl;
  }

  String get iD {
    return this.album.albumID;
  }
}