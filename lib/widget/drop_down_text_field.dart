import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import 'my_text.dart';

class DropDownTextField extends StatelessWidget {
  final VoidCallback? onPressed;
  final String hintText;
  final String? text;
  const DropDownTextField(
      {Key? key, required this.onPressed, this.text, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.black26)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyText(
                    text: text ?? hintText,
                    fontWeight:
                        (text != null) ? FontWeight.w500 : FontWeight.normal,
                    color: (text != null) ? Colors.black : Colors.grey,
                    fontSize: 14.0),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: commonTextGreyColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
