import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prography/core/base/base_view.dart';
import 'package:prography/src/domain/entity/movie.dart';
import 'package:prography/src/service/theme_service.dart';
import 'package:prography/src/view/component/rating.dart';
import 'package:prography/src/view/component/themed_hero.dart';
import 'package:prography/src/view/page/movie_detail/movie_detail_page_model.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    super.key,
    required this.movie,
    required this.imageSize,
  });

  final Movie movie;
  final Size imageSize;

  @override
  Widget build(BuildContext context) {
    return BaseView<MovieDetailPageModel>(
      viewModel: MovieDetailPageModel(
        movie: movie,
        themeService: context.read(),
        remoteGoogleTransRepository: context.read(),
      ),
      builder: (context, viewModel) {
        final deviceSize = MediaQuery.of(context).size;
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              viewModel.translate();
            },
            backgroundColor: context.color.primary,
            child: const Icon(
              Icons.translate,
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: deviceSize.width / imageSize.aspectRatio - 100,
                automaticallyImplyLeading: false,
                elevation: viewModel.isAppBarCollapsed ? 3 : 0,
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: viewModel.isAppBarCollapsed ? 1 : 0,
                  child: Text(
                    viewModel.movie.title,
                    style: context.font.headline4.copyWith(
                      fontWeight: context.font.bold,
                    ),
                  ),
                ),
                titleSpacing: 0,
                leading: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: viewModel.isAppBarCollapsed ? 1 : 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      CupertinoIcons.chevron_back,
                      size: 32,
                      color: context.color.text,
                    ),
                  ),
                ),

                pinned: true,
                actions: [
                  /// Close button
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: viewModel.isAppBarCollapsed ? 0 : 1,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: CircleAvatar(
                        backgroundColor: context.color.hintContainer,
                        radius: 16,
                        child: Icon(
                          Icons.close,
                          color: context.color.onHintContainer,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],

                /// Image
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    /// Check AppBar collapsed
                    Future.microtask(
                      () => viewModel.isAppBarCollapsed = constraints.maxHeight < 120,
                    );
                    return FlexibleSpaceBar(
                      background: Hero(
                        tag: viewModel.movie.largeCoverImage,
                        child: CachedNetworkImage(
                          imageUrl: viewModel.movie.largeCoverImage,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ThemedHero(
                        tag: viewModel.movie.title,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// Title
                            Expanded(
                              child: Text(
                                "[${viewModel.movie.year}] ${viewModel.title}",
                                style: context.font.headline2.copyWith(
                                  fontWeight: context.font.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            /// Rating
                            Rating(rating: viewModel.movie.rating),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// Desc
                      ThemedHero(
                        tag: viewModel.movie.descriptionFull,
                        child: Text(
                          viewModel.description.split('.').asMap().entries.map((entry) {
                            /// 줄 변경
                            int index = entry.key;
                            String word = entry.value;
                            return '$word.${index % 2 == 0 ? '\n' : '\n'}';
                          }).join(),
                          style: context.font.headline6,
                        ),
                      ),

                      const SizedBox(height: 100)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
