// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prography/domain/model/movie.dart';

part 'movie_page.freezed.dart';
part 'movie_page.g.dart';

@freezed
class MoviePage with _$MoviePage {
  factory MoviePage({
    @JsonKey(name: 'movie_count') required int movieCount,
    @JsonKey(name: 'page_number') required int pageNumber,
    required int limit,
    required List<Movie> movies,
  }) = _MoviePage;

  factory MoviePage.fromJson(Map<String, dynamic> json) => _$MoviePageFromJson(json);
}
