import 'package:flutter/material.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader(
      {super.key, required this.title, this.child, this.isDown = false});
  final String title;
  final Widget? child;
  final bool isDown;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 20.0,
                width: 6.0,
                color: colorPrimary,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: MyText(
                text: title,
                fontSize: 16.sp,
                color: commonTextColor,
                fontWeight: FontWeight.w600,
              )),
              Icon(
                isDown ? Icons.arrow_drop_down_circle_outlined : Icons.forward,
                color: colorPrimary,
                size: isDown ? 30.0 : 20.0,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        child ?? const SizedBox.shrink(),
        // const SizedBox(
        //   height: 8.0,
        // ),
      ],
    );
  }
}
