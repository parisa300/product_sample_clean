import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_sample_auth/auth/presentation/widget/parent.dart';
import 'package:test_sample_auth/core/common/widgets/circle_image.dart';
import 'package:test_sample_auth/core/common/widgets/loading.dart';
import 'package:test_sample_auth/core/common/widgets/spacer_h.dart';
import 'package:test_sample_auth/resources/dimens.dart';
import 'package:test_sample_auth/resources/styles.dart';
import 'package:test_sample_auth/user_product/domain/entities/products.dart';
import 'package:test_sample_auth/user_product/domain/usecases/get_products.dart';
import 'package:test_sample_auth/user_product/presentation/product/cubit/products_cubit.dart';
import 'package:test_sample_auth/user_product/presentation/fake_produt.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Product> _products = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: RefreshIndicator(
        color: Theme.of(context).iconTheme.color,
        onRefresh: () {
          _products.clear();
          return context.read<ProductsCubit>().refreshUsers(ProductsParams());
        },
        child: BlocBuilder<ProductsCubit, ProductState>(
          builder: (_, state) {
            return state.when(
              loading: () => const Center(child: Loading()),
              success: (data) {
                _products.addAll(data.products ?? []);

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: 2,
                  padding: EdgeInsets.symmetric(vertical: Dimens.space16),
                  itemBuilder: (_, index) {
                    return index < _products.length
                        ? Container(
                            decoration: BoxDecorations.card.copyWith(
                              color: Theme.of(context).cardColor,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: Dimens.space16,
                              horizontal: Dimens.space24,
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: Dimens.space8,
                              horizontal: Dimens.space16,
                            ),
                            child: Row(
                              children: [
                                CircleImage(
                                  url: _products[index].image ?? "",
                                  size: Dimens.profilePicture,
                                ),
                                const SpacerH(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _products[index].title ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Theme.of(context).hintColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(Dimens.space16),
                            child: const Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          );
                  },
                );
              },
              failure: (message) => const FakeProduct(),
              empty: () => const Center(child: FakeProduct()),
            );
          },
        ),
      ),
    );
  }
}
