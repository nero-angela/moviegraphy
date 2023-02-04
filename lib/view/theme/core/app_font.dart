part of 'app_theme.dart';

class AppFont {
  AppFont({
    required this.fontFamily,
    required this.fontColor,
  });

  /// Font Family
  final FontFamily fontFamily;

  /// Font Weight
  FontWeight get light => fontFamily.light;
  FontWeight get regular => fontFamily.regular;
  FontWeight get semiBold => fontFamily.semiBold;
  FontWeight get bold => fontFamily.bold;

  /// Font Color
  final Color fontColor;

  /// Headline
  late final TextStyle headline1 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily.name,
    fontWeight: regular,
    fontSize: 28,
    color: fontColor,
  );
  late final TextStyle headline2 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily.name,
    fontWeight: regular,
    fontSize: 24,
    color: fontColor,
  );
  late final TextStyle headline3 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily.name,
    fontWeight: regular,
    fontSize: 21,
    color: fontColor,
  );
  late final TextStyle headline4 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily.name,
    fontWeight: regular,
    fontSize: 20,
    color: fontColor,
  );
  late final TextStyle headline5 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily.name,
    fontWeight: regular,
    fontSize: 19,
    color: fontColor,
  );
  late final TextStyle headline6 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily.name,
    fontWeight: regular,
    fontSize: 18,
    color: fontColor,
  );

  /// Subtitle
  late final TextStyle subtitle1 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily.name,
    fontWeight: regular,
    fontSize: 16,
    color: fontColor,
  );
  late final TextStyle subtitle2 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily.name,
    fontWeight: regular,
    fontSize: 15,
    color: fontColor,
  );

  /// Body
  late final TextStyle body1 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily.name,
    fontWeight: regular,
    fontSize: 14,
    color: fontColor,
  );
  late final TextStyle body2 = TextStyle(
    height: 1.3,
    fontFamily: fontFamily.name,
    fontWeight: regular,
    fontSize: 12,
    color: fontColor,
  );
}
