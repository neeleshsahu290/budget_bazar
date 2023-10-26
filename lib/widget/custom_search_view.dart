import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import 'my_text.dart';

class CustomSearchView extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController? controller;
  final bool hasText;
  final bool autofocus;
  final VoidCallback? onClearText;
  final Function(String)? onSubmited;
  const CustomSearchView(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      this.controller,
      this.hasText = false,
      this.autofocus = false,
      required this.onSubmited,
      this.onClearText})
      : super(key: key);

  @override
  State<CustomSearchView> createState() => _CustomSearchViewState();
}

class _CustomSearchViewState extends State<CustomSearchView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
        textInputAction: TextInputAction.search,
        onSubmitted: widget.onSubmited,
        style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        onChanged: widget.onChanged,
        autofocus: widget.autofocus,
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: secondGrey,
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: colorPrimary,
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 32.0),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.w400),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: colorPrimary, width: 0.2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black26,
              width: 0.2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black26,
              width: 0.2,
            ),
          ),
          suffix: widget.hasText
              ? InkWell(
                  onTap: widget.onClearText,
                  child: MyText(
                    text: "Clear",
                    fontSize: 10.0,
                    color: Colors.grey,
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
