import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_color.dart';
import '../constants/assets.dart';

class CustomTextField extends StatelessWidget {
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
  final Color bgColor;
  final double radius;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final Color? textColor;
  final Color borderHighlight;
  final Color borderColor;
  final bool hasContentPadding;
  final double horizontalPadding;
  final String heading;
  final bool isPrefixReq;

  const CustomTextField(
      {Key? key,
      this.heading = "",
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
      this.bgColor = backgroundColor,
      this.hasContentPadding = true,
      this.horizontalPadding = 24.0,
      this.borderColor = secondaryColor,
      this.isPrefixReq = false,
      this.borderHighlight = colorPrimary})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (isCheckoutForm)
          ? const EdgeInsets.all(0)
          : EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: bgColor,
                // boxShadow: [
                //   // BoxShadow(
                //   //   color: Colors.grey.shade200,
                //   //   blurRadius: 2,
                //   //   spreadRadius: 2,
                //   //   offset: const Offset(0, 4),
                //   // ),
                // ],
              ),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),

                controller: controller,
                keyboardType: inputType,
                obscureText: obscureText,
                maxLines: maxLines,
                maxLength: length,
                onChanged: onChanged,
                readOnly: isReadOnly,
                validator: validator,
                inputFormatters: inputFormatter,
                decoration: buildInputDecoration(hintText),

                //  initialValue: "fgjdsg",
              ),
            ),
          ),
          heading != ""
              ? Positioned(
                  top: 0.0,
                  left: 16.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    color: bgColor,
                    child: Text(heading,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: commonTextColor)),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration(String? hinttext) {
    return InputDecoration(
      counterText: "",
      isDense: false,

      // contentPadding: hasContentPadding
      //     ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)
      //     : const EdgeInsets.symmetric(horizontal: 16.0),
      hintText: hinttext,
      hintStyle: const TextStyle(
        color: lightGrey,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: borderHighlight, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),

      //  prefixStyle: ,
      prefixIcon: isPrefixReq
          ? SizedBox(
              width: 55.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(isPrefixReq ? "+91|" : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    )),
              ),
            )
          : const SizedBox(
              width: 20.0,
            ),
      prefixIconConstraints: isPrefixReq
          ? const BoxConstraints(minHeight: 40.0)
          : const BoxConstraints(minWidth: 0, minHeight: 40.0),
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
