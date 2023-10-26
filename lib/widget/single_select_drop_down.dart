import 'package:flutter/material.dart';

import 'my_text.dart';

class SingleSelectDropDown extends StatefulWidget {
  final List<dynamic> itemList;
  final bool isCustomObject;
  final int? selectedItemIndex;

  final Function(dynamic)? onItemSelect;
  const SingleSelectDropDown(
      {Key? key,
      this.isCustomObject = false,
      required this.itemList,
      this.onItemSelect,
      this.selectedItemIndex})
      : super(key: key);

  @override
  State<SingleSelectDropDown> createState() => _SingleSelectDropDownState();
}

class _SingleSelectDropDownState extends State<SingleSelectDropDown> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedItemIndex ?? -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            widget.itemList.length, (index) => chipBuilder(context, index)));
  }

  Widget chipBuilder(context, currentIndex) {
    dynamic tags = widget.itemList[currentIndex];
    bool isActive = selectedIndex == currentIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = currentIndex;
        });
        widget.onItemSelect!(tags);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.grey.shade700 : Colors.white,
          border: Border.all(color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          child: MyText(
            text: widget.isCustomObject ? tags.name : tags,
            color: isActive ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
