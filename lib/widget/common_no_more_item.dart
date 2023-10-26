import 'package:flutter/material.dart';

import 'my_text.dart';

class CommonNoMoreItemUI extends StatelessWidget {
  final String text;
  const CommonNoMoreItemUI({Key? key, this.text = "No More Items Found!"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: MyText(
        text: text,
        textAlignment: TextAlign.center,
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
