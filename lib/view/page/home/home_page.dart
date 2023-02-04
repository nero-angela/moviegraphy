import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prography/service/theme_service.dart';
import 'package:prography/view/component/base_view.dart';
import 'package:prography/view/lang/generated/l10n.dart';
import 'package:prography/view/page/home/component/text_form.dart';
import 'package:prography/view/page/home/home_page_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomePageModel(
        remoteMovieRepository: context.read(),
      ),
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

            /// Search
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextForm(
                  hint: S.current.searchMovieHint,
                  suffix: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.search,
                      color: context.color.text,
                    ),
                  ),
                ),
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
            child: Column(
              children: const [],
            ),
          ),
        );
      },
    );
  }
}
