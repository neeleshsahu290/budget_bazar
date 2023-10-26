import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class CommonIconItem extends StatelessWidget {
  String icon;
  String title;
  CommonIconItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          height: 20.0,
          width: 20.0,
        ),
        const SizedBox(
          width: 5.0,
        ),
        MyText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: commonTextColor,
        ),
      ],
    );
  }
}
