import 'package:flutter/material.dart';

/// MaruBuri
class MaruBuri implements FontFamily {
  const MaruBuri();

  @override
  String get name => 'MaruBuri';

  @override
  FontWeight get light => FontWeight.w300;

  @override
  FontWeight get regular => FontWeight.w400;

  @override
  FontWeight get semiBold => FontWeight.w600;

  @override
  FontWeight get bold => FontWeight.w700;
}

abstract class FontFamily {
  String get name;
  FontWeight get light;
  FontWeight get regular;
  FontWeight get semiBold;
  FontWeight get bold;
}
