import 'package:flutter/material.dart';
import 'package:test_sample_auth/core/utils/context.dart';



class Empty extends StatelessWidget {
  final String? errorMessage;

  const Empty({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
        "assets/image/ic_luncher.jpg",
          width: context.widthInPercent(45),
        ),
        Text(
          errorMessage ?? 'errorNoData',
        ),
      ],
    );
  }
}
