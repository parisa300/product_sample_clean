import 'package:flutter/material.dart';
import 'package:test_sample_auth/resources/dimens.dart';
import 'package:test_sample_auth/resources/palette.dart';


class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const ButtonText({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Palette.primaryLight,
        ),
        child: Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
