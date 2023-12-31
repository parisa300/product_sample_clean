
import 'package:flutter/material.dart';
import 'package:test_sample_auth/core/utils/string.dart';


class CustomPasswordFiled extends StatefulWidget {
  final String label;
  final String? hint;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? onValidator;
  final Widget? suffixIcon;
  final bool autoFocus;
  final String? initialValue;
  final bool? enabled;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final bool isVisibleStar;
  final bool obscureText;


  const CustomPasswordFiled({
    Key? key,
    required this.label,
    this.hint,
    this.textInputAction,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.onValidator,
    this.suffixIcon,
    this.initialValue,
    this.autoFocus = false,
    this.isVisibleStar = false,
    this.enabled,
     this.obscureText=true,
    this.contentPadding,
    required this.controller,
    this.maxLength,
    this.textCapitalization = TextCapitalization.sentences,
  }) : super(key: key);

  @override
  State<CustomPasswordFiled> createState() => _CustomPasswordFiledState();
}

class _CustomPasswordFiledState extends State<CustomPasswordFiled> {
  late bool _showClearButton;

  @override
  void initState() {
    super.initState();
    _showClearButton =_isShowClearButton();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: widget.textCapitalization,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      autofocus: widget.autoFocus,
      onChanged: (String text) {
        setState(() {
          _showClearButton = _isShowClearButton();
        });
        if (widget.onChanged != null) widget.onChanged!(text);
      },
      inputFormatters: [
        FormatField.letterNumberRegex,
      ],
      validator: widget.onValidator,
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: widget.contentPadding,
        // border: InputBorder.none,
        border:  const OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.grey)
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.grey)),
        suffixIcon: widget.suffixIcon ??
            (_showClearButton
                ? IconButton(
              onPressed: () {
                widget.controller.text = " ";
                setState(() {
                  _showClearButton = false;
                });
              },
              icon: const Icon(
                Icons.close,
                color: Colors.grey,
              ),
            )
                : null),
        label: Text(widget.isVisibleStar ? "${widget.label} " : widget.label),
      ),
    );
  }

  bool _isShowClearButton() {
    return widget.controller.text.isNotEmpty && widget.controller.text != " ";
  }
}
