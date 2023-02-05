import 'package:flutter/cupertino.dart';

class CustomPhysics extends ScrollPhysics {
  const CustomPhysics({
    super.parent,
    this.mass,
    this.stiffness,
    this.damping,
  });

  final double? mass;
  final double? stiffness;
  final double? damping;

  @override
  CustomPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => SpringDescription(
        mass: mass ?? 80,
        stiffness: stiffness ?? 100,
        damping: damping ?? 1,
      );
}
