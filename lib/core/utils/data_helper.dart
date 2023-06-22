import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_sample_auth/core/common/pref_manager.dart';

part 'data_helper.freezed.dart';

@unfreezed
class DataHelper with _$DataHelper {
  factory DataHelper({
    String? title,
    String? desc,
    String? iconPath,
    IconData? icon,
    String? url,
    String? type,
    int? id,
    @Default(false) bool isSelected,
    @Default(ActiveTheme.light) ActiveTheme activeTheme,
  }) = _DataHelper;
}
