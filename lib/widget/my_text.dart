import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class MyText extends Text {
  final Color color;
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final FontStyle fontStyle;
  final TextAlign textAlignment;
  final TextDecoration decoration;
  final int? textMaxLines;
  MyText({
    Key? key,
    required this.text,
    this.textMaxLines,
    this.color = commonTextColor,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.decoration = TextDecoration.none,
    this.textAlignment = TextAlign.start,
  }) : super(text,
            key: key,
            textAlign: textAlignment,
            maxLines: textMaxLines,
            overflow: (textMaxLines == null) ? null : TextOverflow.ellipsis,
            // style: GoogleFonts.poppins(
            //     color: color,
            //     fontSize: fontSize,
            //     fontWeight: fontWeight,
            //     fontStyle: fontStyle,
            //     decoration: TextDecoration.none)
            style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: 'Montserrat',
                fontStyle: fontStyle,
                decoration: decoration));
}
