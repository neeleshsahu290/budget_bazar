import 'package:flutter/material.dart';

import 'my_text.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback onCardClick;
  final Widget icon;
  final String label;
  const CustomCard(
      {Key? key,
      required this.onCardClick,
      required this.icon,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardClick,
      child: Container(
        width: 110.0,
        padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32.0, width: 32.0, child: icon),
            const SizedBox(
              height: 8.0,
            ),
            MyText(text: label, fontWeight: FontWeight.normal, fontSize: 14.0)
          ],
        ),
      ),
    );
  }
}
