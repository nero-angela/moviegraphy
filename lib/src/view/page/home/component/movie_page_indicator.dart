import 'package:flutter/material.dart';
import 'package:prography/src/service/theme_service.dart';

class MoviePageIndicator extends StatelessWidget {
  const MoviePageIndicator({
    Key? key,
    required this.isBusy,
    required this.isCenter,
  }) : super(key: key);

  final bool isBusy;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      left: 0,
      right: 0,
      top: isCenter ? 0 : null,
      bottom: isCenter
          ? 0
          : isBusy
              ? 48
              : -48,
      child: IgnorePointer(
        ignoring: true,
        child: Center(
          child: AnimatedContainer(
            width: isBusy ? 42 : 0,
            height: isBusy ? 42 : 0,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: context.color.surface,
              borderRadius: BorderRadius.circular(36),
              boxShadow: isCenter ? null : context.deco.shadow,
            ),
            padding: const EdgeInsets.all(8),
            child: CircularProgressIndicator(
              color: context.color.primary,
              value: isBusy ? null : 0,
            ),
          ),
        ),
      ),
    );
  }
}
