/*import 'package:base/src/models/film_model.dart';
import 'package:base/src/reepositories/films_repository.dart';

import 'package:rxdart/rxdart.dart';

class FlimsBloc {
  final FilmsRepository filmsRepository = FilmsRepository();

  final PublishSubject<List<FilmModel>> filmsFetcher =
      PublishSubject<List<FilmModel>>();

  Stream<List<FilmModel>> get films => filmsFetcher.stream;

  Future<void> fetchFilms() async {
    final filmList = await filmsRepository.fetchFilms();
    filmsFetcher.sink.add(filmList);
  }

  void dispose() {
    filmsFetcher.close();
  }
}*/
