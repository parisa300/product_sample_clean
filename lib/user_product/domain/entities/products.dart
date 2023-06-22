import 'package:freezed_annotation/freezed_annotation.dart';

part 'products.freezed.dart';


@freezed
class Products with _$Products{
  const factory Products({
    String? status,
    List<Product>? products,

  }) = _Products;
}

@freezed
class Product with _$Product {
  const factory Product({
    int? id,
    String? title,
    String? image,
  }) = _Product;
}
