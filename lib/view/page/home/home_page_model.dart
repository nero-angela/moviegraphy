import 'package:flutter/material.dart';
import 'package:prography/domain/model/movie_page.dart';
import 'package:prography/domain/model/movie_search_option.dart';
import 'package:prography/repository/remote/remote_movie_repository.dart';
import 'package:prography/view/component/base_view_model.dart';

class HomePageModel extends BaseViewModel {
  HomePageModel({
    required RemoteMovieRepository remoteMovieRepository,
  }) : _remoteMovieRepository = remoteMovieRepository {
    search();
  }

  final RemoteMovieRepository _remoteMovieRepository;
  final PageController pageController = PageController(
    viewportFraction: 0.85,
  );

  /// MoviePage
  MoviePage moviePage = MoviePage(
    limit: 20,
    movieCount: 0,
    movies: [],
    pageNumber: 0,
  );
  int get total => moviePage.movies.length;

  Future<void> search() async {
    MoviePage? result = await _remoteMovieRepository.search(MovieSearchOption());
    if (result != null) {
      moviePage = result.copyWith(
        movies: [...moviePage.movies, ...result.movies],
      );
      notifyListeners();
    }
  }
}
