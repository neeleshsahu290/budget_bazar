import 'package:flutter/material.dart';

class CustomPageRoute extends MaterialPageRoute {
  int? duration;
  @override
  Duration get transitionDuration => Duration(milliseconds: duration ?? 500);

  CustomPageRoute({required WidgetBuilder builder, this.duration = 500})
      : super(builder: builder);
}
