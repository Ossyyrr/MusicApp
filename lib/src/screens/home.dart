import 'package:base/src/blocs/search_bloc.dart';
import 'package:base/src/models/search_model.dart';
import 'package:base/src/widgets/circular_loader.dart';
import 'package:base/src/widgets/search.dart';
import 'package:base/src/widgets/song_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SearchModel listSong;
  SearchBloc searchBloc = SearchBloc();

  @override
  void dispose() {
    searchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            Search(
              searchBloc: searchBloc,
            ),
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
                        scrollDirection: Axis.vertical,
                        children: _song(searchData),
                      );
                    } else {
                      return Center(
                        child: CircularLoader(
                            size: 30,
                            primaryColor: Colors.red,
                            secondaryColor: Colors.red,
                            backgroundColor: Colors.grey.shade200,
                            strokeWidth: 8),
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
        .map(
          (data) => SongCard(
            title: data.track.title,
            artist: data.track.artist,
            image: data.track.images.coverart,
          ),
        )
        .toList();
  }

  updateListSong(SearchModel data) {
    setState(() {
      listSong = data;
    });
  }
}
