import 'package:flutter/foundation.dart';

class BaseNotifier extends ChangeNotifier {
  bool isDisposed = false;

  @override
  void notifyListeners() {
    if (!isDisposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
