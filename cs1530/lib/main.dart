import 'package:flutter/material.dart';

import 'package:mvvm_flutter/views/friend_page.dart';
import 'package:mvvm_flutter/views/chats_page.dart';
import 'package:mvvm_flutter/views/add_review_page.dart';
import 'package:mvvm_flutter/views/review_page.dart';
import 'package:mvvm_flutter/views/review_details_page.dart';
import 'package:mvvm_flutter/viewmodels/albums_list_view_model.dart';
import 'package:mvvm_flutter/viewmodels/album_info_view_model.dart';
import 'package:mvvm_flutter/viewmodels/rating_view_model.dart';
import 'package:mvvm_flutter/viewmodels/chat_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AlbumListViewModel()),
      ChangeNotifierProvider(create: (context) => AlbumInfoViewModel()),
      ChangeNotifierProvider(create: (context) => RatingProvider()),
      ChangeNotifierProvider(create: (context) => ChatProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MusicBoxd',
        theme: ThemeData(primarySwatch: Colors.blue, canvasColor: Colors.red),
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // review page is first page that user is taken to when app runs
  int _currentIndex = 2;

  final List<String> _routes = [
    '/friend',
    '/chat',
    '/review',
    '/add_review',
    '/review_details'
  ];

  // A GlobalKey for the Navigator
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        _routes[index],
        (route) => false,
      );
    });
  }

  // each route takes user to different page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _navigatorKey,
        initialRoute: '/review',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/friend':
              return MaterialPageRoute(builder: (context) => FriendPage());
            case '/review':
              return MaterialPageRoute(builder: (context) => ReviewPage());
            case '/chat':
              return MaterialPageRoute(builder: (context) => ChatScreen());
            case '/add_review':
              return MaterialPageRoute(builder: (context) => AddReviewPage());
            case '/review_details':
              var iD = settings.arguments as String;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.textsms),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Review',
          ),
        ],
      ),
    );
  }
}



