import 'package:flutter/material.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/widget/custom_container.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class CustomResCard extends StatelessWidget {
  String title;
  String data;
  Color color;
  IconData icon;
  CustomResCard(
      {required this.color,
      required this.data,
      required this.icon,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8.0,
          ),
          CustomContainer(
            horizontalPadding: 8.0,
            verticalPadding: 8.0,
            color: color,
            child: Icon(icon, size: 20.0, color: white, grade: 2.0),
          ),
          const SizedBox(
            width: 25.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                  text: title,
                  fontSize: 14.sp,
                  color: commonTextColor,
                  fontWeight: FontWeight.w500),
              const SizedBox(
                width: 10.0,
              ),
              MyText(
                  text: data,
                  fontSize: 15.sp,
                  color: commonTextColorDark,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ],
      ),
    );
  }
}
