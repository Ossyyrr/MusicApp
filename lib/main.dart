import 'package:base/src/constant/theme_data.dart';
import 'package:base/src/screens/detail_song.dart';
import 'package:base/src/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// KEY OMDB:  7ec272e3

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeDataApp(),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          dynamic arguments = settings.arguments;

          final routes = {
            '/': (BuildContext context) => Home(),
            '/detail': (BuildContext context) => DetailSong(
                  data: arguments['data'],
                ),
          };

          final route = routes[settings.name];

          return MaterialPageRoute<dynamic>(
              builder: (BuildContext ctx) => route!(ctx));
        },
        home: Home());
  }
}
