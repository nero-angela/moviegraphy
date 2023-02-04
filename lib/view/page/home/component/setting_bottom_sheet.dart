import 'package:flutter/cupertino.dart';
import 'package:prography/domain/enum/lang.dart';
import 'package:prography/service/theme_service.dart';
import 'package:prography/view/component/base_bottom_sheet.dart';
import 'package:prography/view/component/tile.dart';
import 'package:prography/view/lang/generated/l10n.dart';
import 'package:provider/provider.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Language
          Tile(
            title: S.current.language,
            subtitle: "${context.themeService.isKo ? Lang.ko : Lang.en}",
            onPressed: context.read<ThemeService>().toggleLang,
          ),

          /// Theme
          Tile(
            title: S.current.theme,
            subtitle: context.themeService.isLightTheme
                ? S.current.lightTheme
                : S.current.darkTheme,
            onPressed: context.read<ThemeService>().toggleTheme,
          ),
        ],
      ),
    );
  }
}
