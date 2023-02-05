import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:prography/core/base/base_remote_repository.dart';
import 'package:prography/core/helper/network_helper.dart';
import 'package:prography/src/domain/entity/movie.dart';
import 'package:prography/src/domain/entity/movie_page.dart';
import 'package:prography/src/domain/entity/movie_search_option.dart';
import 'package:prography/src/domain/enum/movie_genre.dart';
import 'package:prography/src/domain/enum/movie_order.dart';
import 'package:prography/src/domain/enum/movie_quality.dart';
import 'package:prography/src/domain/enum/movie_sort.dart';

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
        "${NetworkHelper.movieAPIUrl}/list_movies.json",
        queryParameters: {
          'query_term': option.query,
          'genre': option.genre?.name,
          'quality': option.quality,
          'sort_by': option.sort,
          'order_by': option.order,
          'minimum_rating': option.minimumRating,
          'limit': option.limit,
          'page': option.page,
          'with_rt_ratings': option.isRottenTomatoesRatings,
        },
      );
      return MoviePage.fromJson(res.data['data']);
    } catch (e, s) {
      log("Fail to search", error: e, stackTrace: s);
      return null;
    }
  }
}
