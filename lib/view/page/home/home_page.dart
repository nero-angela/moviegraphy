import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prography/service/theme_service.dart';
import 'package:prography/view/component/base_view.dart';
import 'package:prography/view/lang/generated/l10n.dart';
import 'package:prography/view/page/home/component/setting_bottom_sheet.dart';
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
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: context.theme.brightness,
              statusBarIconBrightness: context.theme.brightness,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const SettingBottomSheet(),
                  );
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Text(
                  S.current.prography,
                  style: context.font.headline1,
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: context.color.primary,
            unselectedItemColor: context.color.inactive,
            backgroundColor: context.color.surface,
            type: BottomNavigationBarType.fixed,
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
