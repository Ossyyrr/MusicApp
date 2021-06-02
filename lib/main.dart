import 'package:base/src/constant/theme_data.dart';
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
          final routes = {
            '/': (BuildContext context) => Home(),
            //  '/films': (BuildContext context) => Films(),
          };

          final route = routes[settings.name];

          return MaterialPageRoute<dynamic>(
              builder: (BuildContext ctx) => route!(ctx));
        },
        home: Home());
  }
}
