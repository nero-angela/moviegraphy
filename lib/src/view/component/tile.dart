import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prography/src/service/theme_service.dart';

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.title,
    this.subtitle,
    required this.onPressed,
  });

  final String title;
  final String? subtitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: context.font.headline6,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: context.font.body1.copyWith(
                color: context.color.onHintContainer,
                fontWeight: context.font.bold,
              ),
            )
        ],
      ),
      trailing: Icon(
        CupertinoIcons.chevron_right,
        color: context.color.text,
      ),
    );
  }
}
