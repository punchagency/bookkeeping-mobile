import 'package:flutter/material.dart';
import 'package:elmer/core/utils/colors.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    required this.controller,
    this.focusNode,
    super.key,
    this.titleText,
    this.obscureText,
    this.isFilled,
    this.fillColor,
    this.labelText,
    this.hintText,
    this.onTap,
    this.overrideValidator = false,
    this.validator,
    this.keyboardType,
    this.icon,
    this.textInputAction,
    this.prefixText,
    this.textStyle,
    this.isOptional = true,
    this.fieldValue,
    this.color = Colors.white,
  });
  final String? Function(String?)? validator;
  final bool isOptional;
  final bool? obscureText;
  final bool? isFilled;
  final Color? fillColor;
  final Color? color;
  final String? labelText;
  final String? hintText;
  final Widget? icon;
  final String? prefixText;
  final TextStyle? textStyle;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool overrideValidator;
  final TextInputType? keyboardType;
  final String? titleText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? fieldValue;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText ?? false;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(widget.titleText!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: widget.color,
                    )),
            SizedBox(
              width: 5,
            ),
            if (widget.isOptional == false)
              Text('*',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: appColor.white,
                      ))
            else
              const SizedBox.shrink(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
              // color: textColor,
              ),
          onFieldSubmitted: widget.fieldValue,
          controller: widget.controller,
          validator: widget.overrideValidator
              ? widget.validator
              : (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return widget.validator?.call(value);
                },
          obscureText: _isObscured && widget.obscureText!,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            prefixText: widget.prefixText,
            prefixStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              // color: textColor,
              letterSpacing: -0.25,
            ),
            labelText: widget.prefixText,
            labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              // color: textColor,
              letterSpacing: -0.25,
            ),
            // suffixIcon: widget.obscureText != null
            //     ? IconButton(
            //         padding: EdgeInsets.only(right: 18),
            //         icon: _isObscured
            //             ? ImageIcon(
            //                 const AssetImage(MediaRes.visibilityIcon),
            //                 color: lightTextColor,
            //                 size: 24,
            //               )
            //             : Icon(
            //                 Icons.visibility_off,
            //                 // color: borderColor2,
            //                 size: 20,
            //               ),
            //         onPressed: _togglePasswordVisibility,
            //       )
            //     : widget.icon,
            suffixIconConstraints: BoxConstraints(
              maxHeight: widget.obscureText != null ? 48 : 24,
              maxWidth: widget.obscureText != null ? 48 : 24,
              minHeight: widget.obscureText != null ? 48 : 24,
              minWidth: widget.obscureText != null ? 48 : 24,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 21),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  // color: borderColor
                  ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(

                  // color: context.primaryColor ?? borderColor

                  ),
            ),
            filled: widget.isFilled,
            fillColor: widget.fillColor,
            hintText: widget.hintText,
            hintStyle: widget.textStyle ??
                TextStyle(
                  fontSize: 14,
                  // fontFamily: 'PlusJakartaSans',
                  fontWeight: FontWeight.w400,
                  // color: lightTextColor,
                ),
          ),
          focusNode: widget.focusNode,
          onTap: widget.onTap,
        ),
      ],
    );
  }
}
