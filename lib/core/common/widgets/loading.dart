import 'package:flutter/material.dart';
import 'package:test_sample_auth/core/common/widgets/color_loaders.dart';


class Loading extends StatelessWidget {
  const Loading({this.showMessage = true});

  final bool showMessage;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ColorLoader(),
          Visibility(
            visible: showMessage,
            child: Text(
            'pleaseWait',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
