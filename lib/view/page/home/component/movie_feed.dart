import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prography/domain/model/movie.dart';
import 'package:prography/service/theme_service.dart';
import 'package:prography/view/component/rating.dart';

class MovieFeed extends StatelessWidget {
  const MovieFeed({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: context.deco.shadow,
                color: context.color.surface,
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
            crossAxisAlignment: CrossAxisAlignment.end,
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

              /// Rating
              Rating(rating: movie.rating),
            ],
          ),
          const SizedBox(height: 16),

          /// Desc
          Text(movie.summary),

          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: movie.genres.map<Widget>((genre) {
              return Chip(
                label: Text(genre.toUpperCase()),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
