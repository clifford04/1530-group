// user will be taken to this page when they click on an album to review
// they see the album details of the specific album they have clicked on
// they can rate the film that they have clicked on

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/album_info_view_model.dart';
import 'package:mvvm_flutter/viewmodels/rating_view_model.dart';
import 'package:mvvm_flutter/constants.dart';
import 'package:mvvm_flutter/widgets/star_rating.dart';
import 'package:provider/provider.dart';

class ReviewDetailsPage extends StatefulWidget {
  final String iD;

  ReviewDetailsPage(this.iD);

  @override
  _ReviewDetailsPageState createState() => _ReviewDetailsPageState();
}

class _ReviewDetailsPageState extends State<ReviewDetailsPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<AlbumInfoViewModel>(context, listen: false)
        .fetchAlbumDetails(widget.iD);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AlbumInfoViewModel>(context);

    if (vm.albumDetails == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Loading...")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    bool keyExists =
        users_ratings.any((map) => map.containsKey(vm.albumDetails!.title));

    const fontSize = 16.0;

    return Scaffold(
      appBar: AppBar(
          title: Text(
              vm.albumDetails != null ? vm.albumDetails!.title : "Loading...")),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(height: 10),
        // displays the album details
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            vm.albumDetails != null ? vm.albumDetails!.cover : "Loading...",
            width: 155,
            height: 155,
            fit: BoxFit.cover,
          ),
        ),
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.top,
          children: <TableRow>[
            TableRow(children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: Text(
                  "Details:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  vm.albumDetails != null ? vm.albumDetails!.details : "",
                  style: const TextStyle(fontSize: fontSize),
                ),
              ),
            ]),
            TableRow(children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: Text(
                  "Artist:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSize),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  vm.albumDetails != null ? vm.albumDetails!.writer : "",
                  style: const TextStyle(fontSize: fontSize),
                ),
              ),
            ]),
          ],
        ),

        // at bottom of details we can see the five-star rating bar-- in the star_rating.dart
        Visibility(visible: !keyExists, child: Rating()),
        Visibility(
          visible: !keyExists,
          // Review Box
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please write your review below:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                // The TextField widget for entering the review
                TextField(
                  controller: _controller,
                  maxLines: 5, // Allows multiple lines of text
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write your review here...',
                  ),
                ),
                SizedBox(height: 20),
                // The Submit button
              ],
            ),
          ),
        ),
        // this button is clicked when user submits review
        Visibility(
          visible: !keyExists,
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/review');
                final vmm =
                    Provider.of<RatingProvider>(context, listen: false).rating;
                final title = vm.albumDetails!.title;
                users_ratings.add({title: vmm});

                String review = _controller.text;
                if (review.isNotEmpty) {
                  users_reviews.add({title: review});
                }
              },
              icon: Icon(Icons.done),
              label: Text("Submit Review")),
        ),
        Visibility(
          visible: keyExists,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "You have already reviewed this!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
