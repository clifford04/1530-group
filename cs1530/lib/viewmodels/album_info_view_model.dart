// contains code for fetching a album's details

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/web_service.dart';
import 'package:mvvm_flutter/viewmodels/album_details_view_model.dart';

class AlbumInfoViewModel extends ChangeNotifier {
  AlbumDetailsViewModel? albumDetails;

  Future<void> fetchAlbumDetails(String iD) async {
    final results = await Webservice().fetchAlbumDetails(iD);
    albumDetails = AlbumDetailsViewModel(albumDetails: results);
    notifyListeners();
  }
}