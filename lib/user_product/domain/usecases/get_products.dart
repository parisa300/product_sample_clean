import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_sample_auth/core/error/failure.dart';
import 'package:test_sample_auth/core/usecase/usecase.dart';
import 'package:test_sample_auth/user_product/domain/entities/products.dart';
import 'package:test_sample_auth/user_product/domain/repositories/products_repository.dart';

part 'get_products.freezed.dart';
part 'get_products.g.dart';

class GetProducts extends UseCase<Products, ProductsParams> {
  final ProductsRepository _repo;

  GetProducts(this._repo);

  @override
  Future<Either<Failure, Products>> call(ProductsParams params) =>
      _repo.products(params);
}

@freezed
class ProductsParams with _$ProductsParams {
  const factory ProductsParams() = _ProductsParams;

  factory ProductsParams.fromJson(Map<String, dynamic> json) =>
      _$ProductsParamsFromJson(json);
}
