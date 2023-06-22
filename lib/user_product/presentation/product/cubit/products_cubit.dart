
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_sample_auth/core/error/failure.dart';
import 'package:test_sample_auth/user_product/domain/usecases/get_products.dart';

import '../../../domain/entities/products.dart';

part 'products_cubit.freezed.dart';
part 'product_state.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit(this._getproducts) : super(const _Loading());
  final GetProducts _getproducts;

  Future<void> fetchUsers(ProductsParams productsParams) async {
    /// Only show loading in 1 page
    await _fetchData(productsParams);
  }

  Future<void> refreshUsers(ProductsParams productsParams) async {
    await _fetchData(productsParams);
  }

  Future<void> _fetchData(ProductsParams productsParams) async {

      emit(const _Loading());


    final data = await _getproducts.call(productsParams);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        } else if (l is NoDataFailure) {
          emit(const _Empty());
        }
      },
      (r) => emit(_Success(r)),
    );
  }
}
