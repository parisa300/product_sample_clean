import 'package:flutter/material.dart';

import 'list_screen.dart';
import 'item_model_best_product.dart';

class FakeProduct extends StatelessWidget {
  const FakeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = ItemProvider().getDepositList();
    return SizedBox(
      child: ListView.separated(
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListScreen(
              item: list[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 16);
        },
      ),
    );
  }
}
