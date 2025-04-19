// creates a list of albums that contain a given keyword
// used when displaying the albums a user searches for when reviewing

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/web_service.dart';
import 'package:mvvm_flutter/viewmodels/album_view_model.dart';

class AlbumListViewModel extends ChangeNotifier {
  List<AlbumViewModel> albums = <AlbumViewModel>[];

  Future<void> fetchAlbums(String keyword) async {
    final results = await Webservice().fetchAlbums(keyword);
    albums = results.map((item) => AlbumViewModel(album: item)).toList();
    notifyListeners();
  }
}
