import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

mixin ImageHelper {
  static void getNetworkImageSize(String url, Function(Size size) onComplete) async {
    Image image = Image(image: CachedNetworkImageProvider(url));
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo imageInfo, bool synchronousCall) {
          Size size = Size(
            imageInfo.image.width.toDouble(),
            imageInfo.image.height.toDouble(),
          );
          onComplete(size);
        },
      ),
    );
  }
}
