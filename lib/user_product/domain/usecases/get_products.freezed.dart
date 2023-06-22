// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductsParams _$ProductsParamsFromJson(Map<String, dynamic> json) {
  return _ProductsParams.fromJson(json);
}

/// @nodoc
mixin _$ProductsParams {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsParamsCopyWith<$Res> {
  factory $ProductsParamsCopyWith(
          ProductsParams value, $Res Function(ProductsParams) then) =
      _$ProductsParamsCopyWithImpl<$Res, ProductsParams>;
}

/// @nodoc
class _$ProductsParamsCopyWithImpl<$Res, $Val extends ProductsParams>
    implements $ProductsParamsCopyWith<$Res> {
  _$ProductsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ProductsParamsCopyWith<$Res> {
  factory _$$_ProductsParamsCopyWith(
          _$_ProductsParams value, $Res Function(_$_ProductsParams) then) =
      __$$_ProductsParamsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ProductsParamsCopyWithImpl<$Res>
    extends _$ProductsParamsCopyWithImpl<$Res, _$_ProductsParams>
    implements _$$_ProductsParamsCopyWith<$Res> {
  __$$_ProductsParamsCopyWithImpl(
      _$_ProductsParams _value, $Res Function(_$_ProductsParams) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_ProductsParams implements _ProductsParams {
  const _$_ProductsParams();

  factory _$_ProductsParams.fromJson(Map<String, dynamic> json) =>
      _$$_ProductsParamsFromJson(json);

  @override
  String toString() {
    return 'ProductsParams()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ProductsParams);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductsParamsToJson(
      this,
    );
  }
}

abstract class _ProductsParams implements ProductsParams {
  const factory _ProductsParams() = _$_ProductsParams;

  factory _ProductsParams.fromJson(Map<String, dynamic> json) =
      _$_ProductsParams.fromJson;
}
