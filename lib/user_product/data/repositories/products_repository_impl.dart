import 'package:dartz/dartz.dart';
import 'package:test_sample_auth/core/error/failure.dart';
import 'package:test_sample_auth/user_product/data/datasource/product_remote_datasources.dart';
import 'package:test_sample_auth/user_product/domain/entities/products.dart';
import 'package:test_sample_auth/user_product/domain/repositories/products_repository.dart';
import 'package:test_sample_auth/user_product/domain/usecases/get_products.dart';


class ProductsRepositoryImpl implements ProductsRepository {
  /// Data Source
  final ProductsRemoteDatasource productsRemoteDatasource;

  const ProductsRepositoryImpl(this.productsRemoteDatasource);

  @override
  Future<Either<Failure, Products>> products(ProductsParams productsParams) async {
    final response = await productsRemoteDatasource.products(productsParams);

    return response.fold(
      (failure) => Left(failure),
      (usersResponse) {
        if (usersResponse.data?.isEmpty ?? true) {
          return Left(NoDataFailure());
        }
        return Right(usersResponse.toEntity());
      },
    );
  }
}
