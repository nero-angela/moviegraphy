import 'package:flutter/cupertino.dart';
import 'package:prography/src/service/theme_service.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          CupertinoIcons.star_fill,
          color: context.color.secondary,
          size: 21,
        ),
        const SizedBox(width: 8),
        Text(
          "$rating",
          style: context.font.body1.copyWith(
            fontWeight: context.font.bold,
          ),
        ),
      ],
    );
  }
}
