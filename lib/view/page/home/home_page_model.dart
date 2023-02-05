import 'package:flutter/material.dart';
import 'package:prography/domain/enum/movie_genre.dart';
import 'package:prography/domain/model/movie_page.dart';
import 'package:prography/domain/model/movie_search_option.dart';
import 'package:prography/repository/remote/remote_movie_repository.dart';
import 'package:prography/view/component/base_view_model.dart';

class HomePageModel extends BaseViewModel {
  HomePageModel({
    required RemoteMovieRepository remoteMovieRepository,
    required this.genreController,
  }) : _remoteMovieRepository = remoteMovieRepository {
    genreController.addListener(() {
      /// 탭 클릭시 중복 실행 방지
      if (!genreController.indexIsChanging) {
        search();
      }
    });
  }

  final RemoteMovieRepository _remoteMovieRepository;
  final TabController genreController;

  /// 장르별 MoviePage
  Map<MovieGenre, MoviePage> moviePageByGenre = {
    for (MovieGenre genre in MovieGenre.values)
      genre: MoviePage(
        limit: 20,
        movieCount: 0,
        movies: [],
        pageNumber: 0,
      ),
  };

  /// 선택된 장르
  MovieGenre get currentGenre => MovieGenre.values[genreController.index];

  /// 선택된 장르의 MoviePage
  MoviePage get currentMoviePage => moviePageByGenre[currentGenre]!;

  /// 선택된 장르의 영화 개수
  int get currentTotal => currentMoviePage.movies.length;

  /// 특정 장르로 이동
  void animateToGenre(MovieGenre genre) {
    final int genreIndex = MovieGenre.values.indexOf(genre);
    genreController.animateTo(genreIndex);
  }

  /// 선택된 장르 양쪽 N개 검색
  Future<void> search([int n = 5]) async {
    final int currentIndex = MovieGenre.values.indexOf(currentGenre);
    final int lastIndex = MovieGenre.values.length - 1;
    final int start = (currentIndex - n ~/ 2).clamp(0, lastIndex);
    Set<MovieGenre> genreList = {};
    for (int i = start; i < start + n; i++) {
      int index = i.clamp(0, lastIndex);
      genreList.add(MovieGenre.values[index]);
    }
    await Future.wait(genreList.map((genre) => _fetchMovie(genre: genre)));
  }

  /// 선택된 장르의 영화 검색
  Future<void> _fetchMovie({MovieGenre? genre, int? page}) async {
    MovieGenre targetGenre = genre ?? currentGenre;
    MoviePage targetMoviePage = moviePageByGenre[targetGenre]!;

    if (targetMoviePage.movies.isNotEmpty && page == null) {
      /// 0페이지 데이터가 이미 존재
      return;
    }

    MoviePage? result = await _remoteMovieRepository.search(MovieSearchOption(
      genre: targetGenre,
      page: page ?? targetMoviePage.pageNumber,
    ));
    if (result != null) {
      moviePageByGenre[targetGenre] = result.copyWith(
        movies: [...targetMoviePage.movies, ...result.movies],
      );
      notifyListeners();
    }
  }
}
