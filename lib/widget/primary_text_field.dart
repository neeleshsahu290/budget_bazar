import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jds_new/constants/assets.dart';

import '../constants/app_color.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final Function()? onSuffixIconTap;
  final bool isPasswordField;
  final bool isCheckoutForm;
  final bool isReadOnly;
  final int? length;
  final Color backgroundColor;
  final double radius;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final Color? textColor;
  final bool hasContentPadding;
  final String? label;
  final bool isLabelReq;

  const PrimaryTextField(
      {Key? key,
      this.controller,
      this.inputType,
      this.obscureText = false,
      this.onChanged,
      this.validator,
      this.onSuffixIconTap,
      this.hintText,
      this.isPasswordField = false,
      this.isCheckoutForm = false,
      this.isReadOnly = false,
      this.length,
      this.inputFormatter,
      this.radius = 8.0,
      this.maxLines,
      this.textColor = Colors.black,
      this.backgroundColor = white,
      this.hasContentPadding = true,
      this.isLabelReq = false,
      this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              right: 24, left: 24, top: 10.0, bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: backgroundColor,
            ),
            child: TextFormField(
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              controller: controller,
              keyboardType: inputType,
              obscureText: obscureText,
              maxLines: maxLines,
              maxLength: length,
              onChanged: onChanged,
              onTapOutside: (event) {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              readOnly: isReadOnly,
              validator: validator,
              inputFormatters: inputFormatter,
              decoration: buildInputDecoration(hintText),
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String? hinttext) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      contentPadding: hasContentPadding
          ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0)
          : const EdgeInsets.symmetric(horizontal: 22.0),
      hintText: hinttext,
      labelText: isLabelReq ? hinttext : null,
      hintStyle: const TextStyle(
        color: lightGrey,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: colorPrimary, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: Colors.black45,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: Colors.black45,
          width: 1,
        ),
      ),
      suffixIconConstraints: isPasswordField
          ? const BoxConstraints(minHeight: 40.0)
          : const BoxConstraints(minWidth: 0, minHeight: 40.0),
      suffixIcon: isPasswordField
          ? Container(
              width: 24,
              margin: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: onSuffixIconTap,
                child: SvgPicture.asset(
                  obscureText ? passwordHiddenIcon : passwordVisibleIcon,
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
