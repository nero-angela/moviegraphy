import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prography/domain/enum/movie_genre.dart';
import 'package:prography/domain/model/movie.dart';
import 'package:prography/service/theme_service.dart';
import 'package:prography/view/component/rating.dart';

class MovieFeed extends StatelessWidget {
  const MovieFeed({
    super.key,
    required this.movie,
    required this.onGenrePressed,
    required this.currentGenre,
  });

  final Movie movie;
  final MovieGenre currentGenre;
  final void Function(MovieGenre genre) onGenrePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: movie.largeCoverImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Title
              Expanded(
                child: Text(
                  movie.title,
                  style: context.font.headline2.copyWith(
                    fontWeight: context.font.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              /// Rating
              Rating(rating: movie.rating),
            ],
          ),
          if (movie.summary.trim().isNotEmpty) ...[
            const SizedBox(height: 16),

            /// Desc
            Text(
              movie.summary,
              style: context.font.body1,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),
          ],

          /// Genre
          Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: MovieGenre.values.where((genre) {
              return movie.genres.map((g) => g.toLowerCase()).contains(genre.name);
            }).map<Widget>((genre) {
              return ChoiceChip(
                selected: false,
                backgroundColor: context.color.primary,
                onSelected: (_) {
                  onGenrePressed(genre);
                },
                label: Text(
                  "$genre",
                  style: context.font.body1.copyWith(
                    color: context.color.onPrimary,
                    fontWeight: context.font.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
