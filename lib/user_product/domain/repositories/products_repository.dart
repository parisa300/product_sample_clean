import 'package:dartz/dartz.dart';
import 'package:test_sample_auth/core/error/failure.dart';
import 'package:test_sample_auth/user_product/domain/entities/products.dart';
import 'package:test_sample_auth/user_product/domain/usecases/get_products.dart';


abstract class ProductsRepository {
  Future<Either<Failure, Products>> products(ProductsParams productsParams);
}
