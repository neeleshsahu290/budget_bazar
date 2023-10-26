import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class MultiSelectChip<T> extends StatefulWidget {
  final List<T> anyList;
  final Function(List<T>) onSelectionChanged;
  final List<T> selectedList;

  const MultiSelectChip(
      {Key? key,
      required this.anyList,
      required this.onSelectionChanged,
      required this.selectedList})
      : super(key: key);

  @override
  State<MultiSelectChip> createState() => _MultiSelectChipState();
}

class _MultiSelectChipState<T> extends State<MultiSelectChip> {
  // String selectedChoice = "";
  late List<T> selectedChoices;

  @override
  void initState() {
    super.initState();
    if (widget.selectedList.isNotEmpty) {
      selectedChoices = widget.selectedList as List<T>;
    } else {
      selectedChoices = [];
    }
  }

  _buildChoiceList() {
    List<Widget> choices = [];

    for (var item in widget.anyList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          labelStyle: const TextStyle(fontSize: 14.0),
          shape: RoundedRectangleBorder(
              side: selectedChoices.contains(item)
                  ? const BorderSide(color: Colors.green)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(4.0)),
          backgroundColor: Colors.grey[200],
          label: Text("${item.name}"),
          selectedColor: lightGreen,
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
