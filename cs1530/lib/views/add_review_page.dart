// when a user chooses to review a album, this is the first page that they
// are taken to
// here the user can search for a album and will subsequently be displayed a list of
// albums that contain what they searched for
// they can then click on the album of their choice and be taken to another page
// to review it

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/albums_list_view_model.dart';
import 'package:mvvm_flutter/widgets/albums_list.dart';
import 'package:provider/provider.dart';

class AddReviewPage extends StatefulWidget {
  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  // search bar
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // from albums_list_view_model.dart
    final vm = Provider.of<AlbumListViewModel>(context);

    return Scaffold(
        appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      vm.fetchAlbums(value);
                      _controller.clear();
                    }
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),

              // separate class called AlbumList contains the list of albums displayed
              // from albums_list.dart
              Expanded(child: AlbumList(albums: vm.albums))
            ])));
  }
}
