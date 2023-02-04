import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:prography/domain/enum/movie_genre.dart';
import 'package:prography/domain/enum/movie_order.dart';
import 'package:prography/domain/enum/movie_quality.dart';
import 'package:prography/domain/enum/movie_sort.dart';
import 'package:prography/domain/model/movie.dart';
import 'package:prography/domain/model/movie_page.dart';
import 'package:prography/domain/model/movie_search_option.dart';
import 'package:prography/helper/network_helper.dart';
import 'package:prography/repository/base/base_remote_repository.dart';

typedef SearchMovieList = Future<List<Movie>> Function({
  String? queryTern,
  MovieGenre? genre,
  MovieQuality? quality,
  MovieSort? sort,
  MovieOrder? order,
  int? minimumRating,
  int? limit,
  int? page,
  bool? withRottenTomatoesRatings,
});

class RemoteMovieRepository extends BaseRemoteRepository {
  const RemoteMovieRepository({
    required super.dio,
  });

  Future<MoviePage?> search(MovieSearchOption option) async {
    try {
      Response res = await dio.get(
        "${NetworkHelper.movieApiUrl}/list_movies.json",
        queryParameters: {
          'query_term': option.query.toString(),
          'genre': option.genre.toString(),
          'quality': option.quality.toString(),
          'sort_by': option.sort.toString(),
          'order_by': option.order.toString(),
          'minimum_rating': option.minimumRating.toString(),
          'limit': option.limit.toString(),
          'page': option.page.toString(),
          'with_rt_ratings': option.isRottenTomatoesRatings.toString(),
        },
      );
      return MoviePage.fromJson(res.data['data']);
    } catch (e, s) {
      log("Fail to search", error: e, stackTrace: s);
      return null;
    }
  }
}
