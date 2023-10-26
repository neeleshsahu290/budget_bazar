class ApiException implements Exception {
  bool? isDisplay = false;

  /// `true` To display error to user OR `false` to don't show error to user
  String? errorMessage;

  /// error message to send on sentry
  String? displayMessage;

  /// error message to show user
  ApiException({this.errorMessage, this.isDisplay, this.displayMessage});

  @override
  String toString() {
    return "$displayMessage";
  }
}
