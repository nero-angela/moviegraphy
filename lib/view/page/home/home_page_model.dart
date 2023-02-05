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
        limit: 5,
        movieCount: 0,
        movies: [],
        pageNumber: 1,
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

  /// 다음 페이지 요청
  Future<void> searchNextPage() async {
    await _fetchMovie(page: currentMoviePage.pageNumber + 1);
  }

  /// 선택된 장르의 영화 검색
  Future<void> _fetchMovie({MovieGenre? genre, int? page}) async {
    MovieGenre targetGenre = genre ?? currentGenre;
    MoviePage targetMoviePage = moviePageByGenre[targetGenre]!;
    if (targetMoviePage.movies.isNotEmpty && page == null) {
      /// 해당 페이지의 데이터가 이미 있는 경우
      return;
    } else if (targetMoviePage.isBusy) {
      /// 이미 요청중인 경우
      return;
    }

    /// Loading
    moviePageByGenre[targetGenre] = targetMoviePage.copyWith(isBusy: true);
    notifyListeners();

    MoviePage? resultMoviePage = await _remoteMovieRepository.search(MovieSearchOption(
      genre: targetGenre,
      limit: targetMoviePage.limit,
      page: page ?? targetMoviePage.pageNumber,
    ));
    if (resultMoviePage != null) {
      moviePageByGenre[targetGenre] = resultMoviePage.copyWith(
        movies: [...targetMoviePage.movies, ...resultMoviePage.movies],
        isBusy: false,
      );
      notifyListeners();
    }
  }
}
