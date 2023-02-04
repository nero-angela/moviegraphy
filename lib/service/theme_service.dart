import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prography/domain/enum/lang.dart';
import 'package:prography/view/lang/generated/l10n.dart';
import 'package:prography/view/theme/core/app_theme.dart';
import 'package:prography/view/theme/dark_theme.dart';
import 'package:prography/view/theme/light_theme.dart';
import 'package:provider/provider.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    AppTheme? theme,
  }) : theme = theme ?? LightTheme();

  /// 현재 테마
  AppTheme theme;
  bool get isLightTheme => theme.brightness == Brightness.light;

  /// 현재 언어
  bool get isKo => Intl.getCurrentLocale().toLowerCase().contains(Lang.ko.locale);

  /// 언어 변경
  void toggleLang() {
    S.load(Locale(isKo ? Lang.en.locale : Lang.ko.locale));
    notifyListeners();
  }

  /// 테마 변경
  void toggleTheme() {
    if (theme.brightness == Brightness.light) {
      theme = DarkTheme();
    } else {
      theme = LightTheme();
    }
    notifyListeners();
  }

  /// Material ThemeData 커스텀
  ThemeData get themeData {
    return ThemeData(
      /// Remove splash effect
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      /// Font
      fontFamily: theme.font.fontFamily.name,
      textTheme: TextTheme(
        headline1: theme.font.headline1,
        headline2: theme.font.headline2,
        headline3: theme.font.headline3,
        headline4: theme.font.headline4,
        headline5: theme.font.headline5,
        headline6: theme.font.headline6,
        subtitle1: theme.font.subtitle1,
        subtitle2: theme.font.subtitle2,
        bodyText1: theme.font.body1,
        bodyText2: theme.font.body2,
      ),

      /// Scaffold
      scaffoldBackgroundColor: theme.color.surface,

      /// AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: theme.color.surface,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.color.text,
        ),
        titleTextStyle: theme.font.headline2.copyWith(
          color: theme.color.text,
        ),
      ),

      /// BottomSheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: theme.color.surface,
      ),
    );
  }
}

/// context를 이용해 바로 접근
extension BuildContextExt on BuildContext {
  ThemeService get themeService => watch<ThemeService>();
  AppTheme get theme => themeService.theme;
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppFont get font => theme.font;
}
