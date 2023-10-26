import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfiniteScrollController extends ScrollController {
  Key? key;
  Function(int page) onLoadMore;
  int page;
  InfiniteScrollController({this.key, this.page = 0, required this.onLoadMore})
      : super();
  void reset() {
    page = 0;
  }

  @override
  void notifyListeners() {
    {
      if (hasClients && position.pixels == position.maxScrollExtent) {
        page += 1;
        onLoadMore(page);
      }
    }
  }
}
