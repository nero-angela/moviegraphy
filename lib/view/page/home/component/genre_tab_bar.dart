import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:prography/domain/enum/movie_genre.dart';
import 'package:prography/service/theme_service.dart';

class GenreTabBar extends StatelessWidget {
  const GenreTabBar({
    Key? key,
    required this.genreController,
  }) : super(key: key);

  final TabController genreController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: genreController,
      isScrollable: true,
      indicator: BubbleTabIndicator(
        indicatorColor: context.color.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 8,
        ),
        indicatorRadius: 12,
      ),
      tabs: MovieGenre.values.asMap().entries.map<Widget>(
        (entry) {
          final genre = entry.value;
          final index = entry.key;
          final anim =
              genreController.animation ?? const AlwaysStoppedAnimation<double>(0);
          return Tab(
            child: AnimatedBuilder(
              animation: anim,
              builder: (context, child) {
                final offset = genreController.animation?.value ?? 0;
                final isSelected = (offset - index).abs() < 0.5;
                return Text(
                  "$genre".toUpperCase(),
                  style: context.font.body2.copyWith(
                    fontWeight: context.font.bold,
                    color: isSelected ? context.color.onPrimary : context.color.text,
                  ),
                );
              },
            ),
          );
        },
      ).toList(),
    );
  }
}
