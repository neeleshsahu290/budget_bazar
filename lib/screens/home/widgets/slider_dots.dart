import 'package:flutter/material.dart';
import 'package:jds_new/constants/app_color.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;

  const SlideDots(this.isActive, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      height: 8.0,
      width: isActive ? 16.0 : 8.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30,
        ),
        color: isActive ? colorPrimary : Colors.grey.shade300,
      ),
    );
  }
}
