import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prography/core/helper/image_helper.dart';
import 'package:prography/src/domain/entity/movie.dart';
import 'package:prography/src/domain/enum/movie_genre.dart';
import 'package:prography/src/service/theme_service.dart';
import 'package:prography/src/view/component/themed_hero.dart';
import 'package:prography/src/view/component/rating.dart';
import 'package:prography/src/view/page/movie_detail/movie_detail_page.dart';

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
    return GestureDetector(
      onTap: () {
        /// Get image size
        ImageHelper.getNetworkImageSize(
          movie.largeCoverImage,
          (size) {
            /// Go to MovieDetail
            Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) {
                  return MovieDetailPage(
                    movie: movie,
                    imageSize: size,
                  );
                },
              ),
            );
          },
        );
      },
      child: Padding(
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
                  child: Hero(
                    tag: movie.largeCoverImage,
                    child: CachedNetworkImage(
                      imageUrl: movie.largeCoverImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            ThemedHero(
              tag: movie.title,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Title
                  Expanded(
                    child: Text(
                      "[${movie.year}] ${movie.title}",
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
            ),
            if (movie.summary.trim().isNotEmpty) ...[
              const SizedBox(height: 16),

              /// Desc
              ThemedHero(
                tag: movie.descriptionFull,
                child: Text(
                  movie.descriptionFull,
                  style: context.font.headline6,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
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
      ),
    );
  }
}
