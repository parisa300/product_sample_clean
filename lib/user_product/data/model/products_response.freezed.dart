// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) {
  return _ProductsResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductsResponse {
  String? get status => throw _privateConstructorUsedError;
  List<DataProduct>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsResponseCopyWith<ProductsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsResponseCopyWith<$Res> {
  factory $ProductsResponseCopyWith(
          ProductsResponse value, $Res Function(ProductsResponse) then) =
      _$ProductsResponseCopyWithImpl<$Res, ProductsResponse>;
  @useResult
  $Res call({String? status, List<DataProduct>? data});
}

/// @nodoc
class _$ProductsResponseCopyWithImpl<$Res, $Val extends ProductsResponse>
    implements $ProductsResponseCopyWith<$Res> {
  _$ProductsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataProduct>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductsResponseCopyWith<$Res>
    implements $ProductsResponseCopyWith<$Res> {
  factory _$$_ProductsResponseCopyWith(
          _$_ProductsResponse value, $Res Function(_$_ProductsResponse) then) =
      __$$_ProductsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, List<DataProduct>? data});
}

/// @nodoc
class __$$_ProductsResponseCopyWithImpl<$Res>
    extends _$ProductsResponseCopyWithImpl<$Res, _$_ProductsResponse>
    implements _$$_ProductsResponseCopyWith<$Res> {
  __$$_ProductsResponseCopyWithImpl(
      _$_ProductsResponse _value, $Res Function(_$_ProductsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ProductsResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataProduct>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductsResponse extends _ProductsResponse {
  const _$_ProductsResponse({this.status, final List<DataProduct>? data})
      : _data = data,
        super._();

  factory _$_ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProductsResponseFromJson(json);

  @override
  final String? status;
  final List<DataProduct>? _data;
  @override
  List<DataProduct>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductsResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsResponse &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsResponseCopyWith<_$_ProductsResponse> get copyWith =>
      __$$_ProductsResponseCopyWithImpl<_$_ProductsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductsResponseToJson(
      this,
    );
  }
}

abstract class _ProductsResponse extends ProductsResponse {
  const factory _ProductsResponse(
      {final String? status,
      final List<DataProduct>? data}) = _$_ProductsResponse;
  const _ProductsResponse._() : super._();

  factory _ProductsResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductsResponse.fromJson;

  @override
  String? get status;
  @override
  List<DataProduct>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsResponseCopyWith<_$_ProductsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

DataProduct _$DataProductFromJson(Map<String, dynamic> json) {
  return _DataProduct.fromJson(json);
}

/// @nodoc
mixin _$DataProduct {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataProductCopyWith<DataProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataProductCopyWith<$Res> {
  factory $DataProductCopyWith(
          DataProduct value, $Res Function(DataProduct) then) =
      _$DataProductCopyWithImpl<$Res, DataProduct>;
  @useResult
  $Res call({int? id, String? title, String? image});
}

/// @nodoc
class _$DataProductCopyWithImpl<$Res, $Val extends DataProduct>
    implements $DataProductCopyWith<$Res> {
  _$DataProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataProductCopyWith<$Res>
    implements $DataProductCopyWith<$Res> {
  factory _$$_DataProductCopyWith(
          _$_DataProduct value, $Res Function(_$_DataProduct) then) =
      __$$_DataProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? title, String? image});
}

/// @nodoc
class __$$_DataProductCopyWithImpl<$Res>
    extends _$DataProductCopyWithImpl<$Res, _$_DataProduct>
    implements _$$_DataProductCopyWith<$Res> {
  __$$_DataProductCopyWithImpl(
      _$_DataProduct _value, $Res Function(_$_DataProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_DataProduct(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataProduct implements _DataProduct {
  const _$_DataProduct({this.id, this.title, this.image});

  factory _$_DataProduct.fromJson(Map<String, dynamic> json) =>
      _$$_DataProductFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? image;

  @override
  String toString() {
    return 'DataProduct(id: $id, title: $title, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataProductCopyWith<_$_DataProduct> get copyWith =>
      __$$_DataProductCopyWithImpl<_$_DataProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataProductToJson(
      this,
    );
  }
}

abstract class _DataProduct implements DataProduct {
  const factory _DataProduct(
      {final int? id,
      final String? title,
      final String? image}) = _$_DataProduct;

  factory _DataProduct.fromJson(Map<String, dynamic> json) =
      _$_DataProduct.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_DataProductCopyWith<_$_DataProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
