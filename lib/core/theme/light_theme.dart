import 'package:flutter/material.dart';

import 'core/app_theme.dart';
import 'res/font.dart';
import 'res/palette.dart';

class LightTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;

  @override
  AppColor color = AppColor(
    surface: Palette.grey100,
    background: Palette.black.withOpacity(0.55),
    text: Palette.black,
    subtext: Palette.grey700,
    hint: Palette.grey300,
    hintContainer: Palette.grey150,
    onHintContainer: Palette.grey500,
    inactive: Palette.grey400,
    inactiveContainer: Palette.grey250,
    onInactiveContainer: Palette.white,
    primary: Palette.red,
    onPrimary: Palette.white,
    secondary: Palette.yellow,
    onSecondary: Palette.white,
  );

  @override
  late AppFont font = AppFont(
    fontFamily: const MaruBuri(),
    fontColor: color.text,
  );

  @override
  AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.5),
        blurRadius: 35,
      ),
    ],
  );
}
