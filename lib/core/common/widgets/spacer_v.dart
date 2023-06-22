import 'package:flutter/material.dart';
import 'package:test_sample_auth/resources/dimens.dart';


class SpacerV extends StatelessWidget {
  const SpacerV({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: value ?? Dimens.space8,
    );
  }
}
