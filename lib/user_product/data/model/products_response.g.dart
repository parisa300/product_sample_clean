// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductsResponse _$$_ProductsResponseFromJson(Map<String, dynamic> json) =>
    _$_ProductsResponse(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductsResponseToJson(_$_ProductsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$_DataProduct _$$_DataProductFromJson(Map<String, dynamic> json) =>
    _$_DataProduct(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_DataProductToJson(_$_DataProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
