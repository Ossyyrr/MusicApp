import 'package:base/src/models/search_model.dart';
import 'package:base/src/reepositories/search_repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  final SearchRepository searchRepository = SearchRepository();

  final PublishSubject<SearchModel> searchFetcher =
      PublishSubject<SearchModel>();

  Stream<SearchModel> get search => searchFetcher.stream;

  Future<SearchModel> fetchSearch(String text) async {
    final search = await searchRepository.fetchSearch(text);
    searchFetcher.sink.add(search);
    return search;
  }

  void dispose() {
    searchFetcher.close();
  }
}
