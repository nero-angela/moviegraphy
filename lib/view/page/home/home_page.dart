import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prography/helper/intl_helper.dart';
import 'package:prography/service/theme_service.dart';
import 'package:prography/view/base/base_view.dart';
import 'package:prography/view/lang/generated/l10n.dart';
import 'package:prography/view/page/home/home_page_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomePageModel(),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: context.theme.brightness,
              statusBarIconBrightness: context.theme.brightness,
            ),
            toolbarHeight: 0,
          ),
          body: SafeArea(
            child: Row(
              children: [
                Text(
                  S.current.prography,
                  style: context.font.headline1,
                ),
                IconButton(
                  onPressed: () {
                    context.read<ThemeService>().toggleTheme();
                  },
                  icon: Icon(
                    context.isLightTheme ? CupertinoIcons.sun_max : CupertinoIcons.moon,
                    color: context.isLightTheme
                        ? context.color.primary
                        : context.color.secondary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<ThemeService>().toggleLang();
                  },
                  child: Text(
                    IntlHelper.isKo ? S.current.ko : S.current.en,
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: context.color.primary,
            unselectedItemColor: context.color.inactive,
            backgroundColor: context.color.surface,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.home),
                label: S.current.feed,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.search),
                label: S.current.search,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.person),
                label: S.current.my,
              ),
            ],
          ),
        );
      },
    );
  }
}
