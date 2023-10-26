import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_color.dart';
import 'my_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color appBarColor;
  final Color titleColor;
  final Widget? flexiableWidget;
  final String? title;
  final bool isLight;
  final double? height;
  final List<Widget>? actionsList;
  final VoidCallback? onBackPressed;
  final Widget? leading;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final bool isTitleCenter;
  final FontWeight fontWeight;
  final SystemUiOverlayStyle systemOverlayStyle;
  const CustomAppBar(
      {Key? key,
      this.appBarColor = white,
      this.titleColor = commonTextColor,
      this.systemOverlayStyle = SystemUiOverlayStyle.dark,
      this.leading,
      this.title,
      this.actionsList,
      this.onBackPressed,
      this.bottom,
      this.isTitleCenter = true,
      this.elevation = 1,
      this.fontWeight = FontWeight.w500,
      this.height,
      this.isLight = false,
      this.flexiableWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      systemOverlayStyle: systemOverlayStyle,
      leadingWidth: (onBackPressed == null && leading == null) ? 16 : 48,
      leading: (leading != null)
          ? leading
          : (onBackPressed != null)
              ? Tooltip(
                  message: "Back",
                  child: IconButton(
                    onPressed: onBackPressed,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18.0,
                      color: isLight ? white : Colors.black,
                    ),
                    color: white,
                  ),
                )
              : const SizedBox(),
      backgroundColor: appBarColor,
      title: title != null
          ? MyText(
              text: title!,
              fontWeight: fontWeight,
              color: titleColor,
            )
          : null,
      flexibleSpace: flexiableWidget,
      bottom: bottom,
      centerTitle: isTitleCenter,
      actions: actionsList,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 55.0);
}
