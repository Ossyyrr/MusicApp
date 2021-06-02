import 'package:base/src/blocs/search_bloc.dart';
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
  SearchBloc searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            Search(
              updateListSong: updateListSong,
              searchBloc: searchBloc,
            ),
            // if (isInitialized) Text(listSong.tracks!.hits[0].track.artist)
            Container(
              width: 300,
              height: 300,
              child: StreamBuilder(
                  stream: searchBloc.search,
                  builder: (_, snapshot) {
                    final searchData = snapshot.data as SearchModel?;
                    final loading = !snapshot.hasError && !snapshot.hasData;

                    if (searchData != null && !loading) {
                      return ListView(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        children: _song(searchData),
                      );
                    } else {
                      return Container(
                        color: Colors.red,
                        child: Text('LOADER'),
                      );
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }

  List<Widget> _song(SearchModel? searchData) {
    return searchData!.tracks!.hits
        .map((data) => Container(
              width: 40,
              height: 40,
              child: Text(data.track.title),
            ))
        .toList();
  }

  updateListSong(SearchModel data) {
    setState(() {
      listSong = data;
      isInitialized = true;
    });
  }
}
