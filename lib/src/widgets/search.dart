import 'package:base/src/blocs/search_bloc.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key, required this.searchBloc}) : super(key: key);
  final SearchBloc searchBloc;
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller = TextEditingController();
  String inputSearch = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Finder",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                ),
                hintStyle: TextStyle(color: Theme.of(context).accentColor),
                suffixIcon: IconButton(
                  onPressed: () => _search(inputSearch),
                  icon: Icon(Icons.search),
                  color: Theme.of(context).accentColor,
                ),
              ),
              onChanged: (text) {
                setState(() {
                  inputSearch = text;
                });
              })),
    );
  }

  Future<void> _search(String text) async {
    print('llamar a la api con: ' + inputSearch);
    _controller.clear();
    await widget.searchBloc.fetchSearch(text);
  }
}
