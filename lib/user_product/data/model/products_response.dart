import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_sample_auth/user_product/domain/entities/products.dart';

part 'products_response.freezed.dart';

part 'products_response.g.dart';

@freezed
class ProductsResponse with _$ProductsResponse {
  const factory ProductsResponse({
    String? status,
    List<DataProduct>? data,
  }) = _ProductsResponse;

  const ProductsResponse._();

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Products toEntity() {
    final listProduct = data!
        .map<Product>(
          (model) => Product(
            id: model.id,
            title: model.title ?? "",
            image: model.image ?? "",
          ),
        )
        .toList();

    return Products(
      products: listProduct,
    );
  }
}

@freezed
class DataProduct with _$DataProduct {
  const factory DataProduct({
    int? id,
    String? title,
    String? image,
  }) = _DataProduct;

  factory DataProduct.fromJson(Map<String, dynamic> json) =>
      _$DataProductFromJson(json);
}
