import 'package:flutter/material.dart';
import 'package:prography/src/service/theme_service.dart';

class ThemedHero extends StatelessWidget {
  const ThemedHero({
    super.key,
    required this.tag,
    required this.child,
  });

  final String tag;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: DefaultTextStyle(
        style: context.font.headline6,
        child: child,
      ),
    );
  }
}
