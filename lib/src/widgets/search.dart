import 'package:base/src/blocs/search_bloc.dart';
import 'package:base/src/reepositories/search_repository.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search(
      {Key? key, required this.updateListSong, required this.searchBloc})
      : super(key: key);
  final Function updateListSong;
  final SearchBloc searchBloc;
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller = TextEditingController();
  String inputSearch = '';
  //SearchRepository searchRepository = SearchRepository();

  @override
  void dispose() {
    widget.searchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
        child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Enter a message",
              suffixIcon: IconButton(
                onPressed: () => _search(inputSearch),
                icon: Icon(Icons.search),
              ),
            ),
            onChanged: (text) {
              setState(() {
                inputSearch = text;
              });
            }));
  }

  Future<void> _search(String text) async {
    print('llamar a la api con: ' + inputSearch);
    _controller.clear();
    var data = await widget.searchBloc.fetchSearch(text);
    widget.updateListSong(data);
  }
}
