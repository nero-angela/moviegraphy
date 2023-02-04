import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prography/domain/enum/movie_genre.dart';
import 'package:prography/domain/enum/movie_order.dart';
import 'package:prography/domain/enum/movie_quality.dart';
import 'package:prography/domain/enum/movie_sort.dart';

part 'movie_search_option.freezed.dart';
part 'movie_search_option.g.dart';

@freezed
class MovieSearchOption with _$MovieSearchOption {
  factory MovieSearchOption({
    String? query,
    MovieGenre? genre,
    @Default(MovieQuality.all) MovieQuality quality,
    @Default(MovieSort.dateAdded) MovieSort sort,
    @Default(MovieOrder.desc) MovieOrder order,
    @Default(0) int minimumRating,
    @Default(20) int limit,
    @Default(0) int page,
    @Default(false) bool isRottenTomatoesRatings,
  }) = _MovieSearchOption;

  factory MovieSearchOption.fromJson(Map<String, dynamic> json) =>
      _$MovieSearchOptionFromJson(json);
}
