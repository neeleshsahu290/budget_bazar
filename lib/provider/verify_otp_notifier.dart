import 'dart:async';

import 'package:jds_new/provider/base_notifier.dart';

class VerifyOTPNotifier extends BaseNotifier {
  VerifyOTPNotifier() {
    initTimer();
  }
  int secondsRemaining = 60;
  bool enableResend = false;
  Timer? _timer;

  // final Repository _repository = Repository();

  initTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining--;
        notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
        _timer?.cancel();
      }
    });
  }

  restartTimer() {
    secondsRemaining = 60;
    enableResend = false;
    initTimer();
  }

  // resendOtpLogin({required var email, required var uid}) async {
  //   final response = await _repository.resendOtp(email: email, uid: uid);
  //   if (response['status'] == success) {
  //     showSnackBar(message: "We've resent you the OTP on $email");
  //     restartTimer();
  //   } else {
  //     showErrorSnackBar(message: response['error']);
  //   }
  // }

  // Future otpVerification(
  //     {required var email, required var otp, required var uid}) async {
  //   final response =
  //       await _repository.verifyOtp(email: email, otp: otp, uid: uid);
  //   if (response['status'] == success) {
  //     return response['data'];
  //   } else {
  //     showErrorSnackBar(message: response['error']);
  //     return null;
  //   }
  // }

  @override
  dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
