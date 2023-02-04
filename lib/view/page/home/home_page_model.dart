import 'package:prography/domain/model/movie_page.dart';
import 'package:prography/domain/model/movie_search_option.dart';
import 'package:prography/repository/remote/remote_movie_repository.dart';
import 'package:prography/view/base/base_view_model.dart';

class HomePageModel extends BaseViewModel {
  HomePageModel({
    required RemoteMovieRepository remoteMovieRepository,
  }) : _remoteMovieRepository = remoteMovieRepository;

  final RemoteMovieRepository _remoteMovieRepository;

  MoviePage? moviePage;

  Future<void> searchMovieList() async {
    moviePage = await _remoteMovieRepository.search(MovieSearchOption());
    notifyListeners();
  }
}
