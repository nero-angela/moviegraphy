// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'url') required String url,
    @JsonKey(name: 'imdb_code') required String imdbCode,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'title_english') required String titleEnglish,
    String? titleKorean,
    @JsonKey(name: 'title_long') required String titleLong,
    @JsonKey(name: 'slug') required String slug,
    @JsonKey(name: 'year') required int year,
    @JsonKey(name: 'rating') required double rating,
    @JsonKey(name: 'runtime') required int runtime,
    @JsonKey(name: 'genres') required List<String> genres,
    @JsonKey(name: 'summary') required String summary,
    @JsonKey(name: 'description_full') required String descriptionFull,
    String? descriptionFullKorean,
    @JsonKey(name: 'synopsis') required String synopsis,
    @JsonKey(name: 'yt_trailer_code') required String ytTrailerCode,
    @JsonKey(name: 'language') required String language,
    @JsonKey(name: 'mpa_rating') required String mpaRating,
    @JsonKey(name: 'background_image') required String backgroundImage,
    @JsonKey(name: 'background_image_original') required String backgroundImageOriginal,
    @JsonKey(name: 'small_cover_image') required String smallCoverImage,
    @JsonKey(name: 'medium_cover_image') required String mediumCoverImage,
    @JsonKey(name: 'large_cover_image') required String largeCoverImage,
    @JsonKey(name: 'state') required String state,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
