import 'package:flutter/material.dart';
import 'package:test_sample_auth/user_product/presentation/item_model_best_product.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key, required this.item}) : super(key: key);
  final ItemModelBestProduct item;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                item.image,
                fit: BoxFit.fitHeight,
              )),
          Text(item.title)
        ],
      ),
    );
  }
}
