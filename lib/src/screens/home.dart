import 'package:base/src/models/search_model.dart';
import 'package:base/src/widgets/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SearchModel listSong;
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            Search(updateListSong: updateListSong),
            if (isInitialized) Text(listSong.tracks!.hits[0].track.artist)
          ],
        ),
      )),
    );
  }

  updateListSong(SearchModel data) {
    setState(() {
      listSong = data;
      isInitialized = true;
    });
  }
}
