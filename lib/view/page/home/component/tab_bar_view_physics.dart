import 'package:flutter/cupertino.dart';

class TabBarViewPhysics extends ScrollPhysics {
  const TabBarViewPhysics({
    super.parent,
  });

  @override
  TabBarViewPhysics applyTo(ScrollPhysics? ancestor) {
    return TabBarViewPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 80,
        stiffness: 100,
        damping: 1,
      );
}
