import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prography/domain/enum/movie_genre.dart';
import 'package:prography/service/theme_service.dart';
import 'package:prography/view/component/base_view.dart';
import 'package:prography/view/lang/generated/l10n.dart';
import 'package:prography/view/page/home/component/genre_tab_bar.dart';
import 'package:prography/view/page/home/component/movie_feed.dart';
import 'package:prography/view/page/home/home_page_model.dart';
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
              style: context.font.headline1,
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
              /// Language
              IconButton(
                onPressed: context.themeService.toggleLang,
                icon: Text(
                  (context.themeService.isKo ? S.current.ko : S.current.en).toUpperCase(),
                  style: context.font.body1.copyWith(
                    fontWeight: context.font.bold,
                    color: context.themeService.isLightTheme
                        ? context.color.primary
                        : context.color.secondary,
                  ),
                ),
              ),

              /// Theme
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
          body: SafeArea(
            child: viewModel.currentTotal == 0

                /// Loading
                ? Center(
                    child: CircularProgressIndicator(
                    color: context.color.primary,
                  ))

                /// Movie Feed List
                : TabBarView(
                    controller: genreController,
                    children: viewModel.moviePageByGenre.values.map<Widget>(
                      (moviePage) {
                        return ListView.builder(
                          itemCount: moviePage.movies.length,
                          itemBuilder: (context, index) {
                            final movie = moviePage.movies[index];
                            return MovieFeed(
                              movie: movie,
                              currentGenre: viewModel.currentGenre,
                              onGenrePressed: viewModel.animateToGenre,
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
          ),
        );
      },
    );
  }
}
