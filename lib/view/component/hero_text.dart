import 'package:flutter/material.dart';

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
      child: Material(
        child: child,
      ),
    );
  }
}
