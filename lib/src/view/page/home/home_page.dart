import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prography/core/base/base_view.dart';
import 'package:prography/core/lang/generated/l10n.dart';
import 'package:prography/src/domain/entity/movie_page.dart';
import 'package:prography/src/domain/enum/movie_genre.dart';
import 'package:prography/src/service/theme_service.dart';
import 'package:prography/src/view/component/custom_physics.dart';
import 'package:prography/src/view/page/home/component/genre_tab_bar.dart';
import 'package:prography/src/view/page/home/component/movie_feed.dart';
import 'package:prography/src/view/page/home/component/movie_page_indicator.dart';
import 'package:prography/src/view/page/home/home_page_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final HomePageModel homePageModel = HomePageModel(
    remoteMovieRepository: context.read(),
    genreController: genreController,
  );

  late final TabController genreController = TabController(
    vsync: this,
    length: MovieGenre.values.length,
  );

  @override
  void initState() {
    super.initState();
    homePageModel.search();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: homePageModel,
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.current.prography,
              style: context.font.headline1.copyWith(
                fontWeight: context.font.bold,
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: context.theme.brightness,
              statusBarIconBrightness: context.theme.brightness,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                /// GenreTabBar
                child: GenreTabBar(genreController: genreController),
              ),
            ),
            actions: [
              /// Language Toggle
              IconButton(
                onPressed: context.themeService.toggleLang,
                icon: Text(
                  (context.themeService.isKo ? "EN" : "KO").toUpperCase(),
                  style: context.font.headline6.copyWith(
                    fontWeight: context.font.bold,
                    color: context.themeService.isLightTheme
                        ? context.color.primary
                        : context.color.secondary,
                  ),
                ),
              ),

              /// Theme Toggle
              IconButton(
                onPressed: context.themeService.toggleTheme,
                icon: Icon(
                  context.themeService.isLightTheme
                      ? CupertinoIcons.sun_max_fill
                      : CupertinoIcons.moon_fill,
                  color: context.themeService.isLightTheme
                      ? context.color.primary
                      : context.color.secondary,
                ),
              ),
            ],
          ),
          body: TabBarView(
            controller: genreController,
            children: viewModel.moviePageByGenre.keys.map<Widget>(
              (genre) {
                final MoviePage moviePage = viewModel.moviePageByGenre[genre]!;
                final bool isFirstPage = moviePage.pageNumber == 1;

                return Stack(
                  children: [
                    /// Scroll Ended -> Next Page
                    NotificationListener<ScrollEndNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.extentAfter < 500) {
                          if (!viewModel.currentMoviePage.isBusy) {
                            viewModel.searchNextPage();
                          }
                        }
                        return false;
                      },

                      /// Movie Feed List
                      child: ListView.builder(
                        physics: const CustomPhysics(),
                        key: PageStorageKey(genre),
                        itemCount: moviePage.movies.length,
                        itemBuilder: (context, index) {
                          final movie = moviePage.movies[index];
                          return MovieFeed(
                            movie: movie,
                            currentGenre: viewModel.currentGenre,
                            onGenrePressed: viewModel.animateToGenre,
                          );
                        },
                      ),
                    ),

                    /// Loading
                    MoviePageIndicator(
                      isCenter: isFirstPage,
                      isBusy: moviePage.isBusy,
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
