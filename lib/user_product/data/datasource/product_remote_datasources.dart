import 'package:dartz/dartz.dart';
import 'package:test_sample_auth/core/api/dio_client.dart';
import 'package:test_sample_auth/core/api/list_api.dart';
import 'package:test_sample_auth/core/error/failure.dart';
import 'package:test_sample_auth/user_product/data/model/products_response.dart';
import 'package:test_sample_auth/user_product/domain/usecases/get_products.dart';

abstract class ProductsRemoteDatasource {
  Future<Either<Failure, ProductsResponse>> products(ProductsParams userParams);
}

class ProductsRemoteDatasourceImpl implements ProductsRemoteDatasource {
  final DioClient _client;

  ProductsRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, ProductsResponse>> products(
      ProductsParams productsParams) async {
    final response = await _client.getRequest(
      ListAPI.product,
      queryParameters: productsParams.toJson(),
      converter: (response) =>
          ProductsResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }
}
