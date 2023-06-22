part of 'products_cubit.dart';


@freezed
class ProductState with _$ProductState {
  const factory ProductState.loading() = _Loading;
  const factory ProductState.success(Products data) = _Success;
  const factory ProductState.failure(String message) = _Failure;
  const factory ProductState.empty() = _Empty;
}
