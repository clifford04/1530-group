// this is the class that displays a list of albums given a user's search

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/album_view_model.dart';

class AlbumList extends StatelessWidget {
  // from album_view_model.dart
  final List<AlbumViewModel> albums;

  AlbumList({required this.albums});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.albums.length,
      itemBuilder: (context, index) {
        final album = this.albums[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(album.cover)),
                borderRadius: BorderRadius.circular(6)),
            width: 50,
            height: 100,
          ),
          title: Text(album.title),
          onTap: () {
            // if specific album is hit, then go to review_details_page.dart
            Navigator.pushNamed(context, '/review_details',
                arguments: album.iD);
          },
        );
      },
    );
  }
}