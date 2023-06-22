import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:test_sample_auth/core/common/log.dart';
import 'package:test_sample_auth/core/common/widgets/toast.dart';
import 'package:test_sample_auth/resources/palette.dart';

extension StringExtension on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  void toToastError() {
    try {
      final message = isEmpty ? "error" : this;

      //dismiss before show toast
      dismissAllToast(showAnim: true);

      showToastWidget(
        Toast(
          bgColor: Palette.red,
          icon: Icons.error,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      log.e("error $e");
    }
  }

  void toToastSuccess() {
    try {
      final message = isEmpty ? "success" : this;

      //dismiss before show toast
      dismissAllToast(showAnim: true);

      // showToast(msg)
      showToastWidget(
        const Toast(
          bgColor: Colors.green,
          icon: Icons.check_circle,
          message: "success",
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      log.e("$e");
    }
  }

  void toToastLoading() {
    try {
      final message = isEmpty ? "loading" : this;
      //dismiss before show toast
      dismissAllToast(showAnim: true);

      showToastWidget(
        Toast(
          bgColor: Colors.black,
          icon: Icons.info,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      log.e("$e");
    }
  }
}
class FormatField{

  static TextInputFormatter emailRegex =
  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9@.]"));

  static TextInputFormatter letterNumberRegex =
  FilteringTextInputFormatter.allow(
    RegExp("[a-zA-Z0-9!#\$%&'*+-/=?^_ `{|}~]"),
  );
}