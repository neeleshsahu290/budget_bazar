// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/constants/assets.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/helper/session_manager.dart';
import 'package:jds_new/provider/verify_otp_notifier.dart';
import 'package:jds_new/repository/base_repository.dart';
import 'package:jds_new/screens/dashboard/ui/dashboard_screen.dart';
import 'package:jds_new/screens/login/model/login_model.dart';
import 'package:jds_new/screens/login/model/verify_model.dart';
import 'package:jds_new/util/common_utils.dart';
import 'package:jds_new/util/utils.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_button.dart';
import 'package:jds_new/widget/primary_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pinput/pinput.dart';

final verifyLoadingStateProvider = StateProvider<bool>((ref) {
  return false;
});
final verifyOTPNotifier =
    ChangeNotifierProvider.autoDispose<VerifyOTPNotifier>((ref) {
  return VerifyOTPNotifier();
});

class VerifyOtpScreen extends StatefulWidget {
  final int customerId;
  final String mobileNo;

  const VerifyOtpScreen(
      {Key? key, required this.customerId, required this.mobileNo})
      : super(key: key);

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _controller = TextEditingController();
  final focusNode = FocusNode();
  final _formkey = GlobalKey<FormState>();
  final Repository _repository = Repository();
  late int customerId;

  loginUser(WidgetRef ref) async {
    final response = await _repository.loginUser(mobileNo: widget.mobileNo);
    if (response['status'] == success) {
      var (String message, LoginModel loginModel) = response['data'];

      showSnackBar(message: message);
      customerId = loginModel.customerId ?? 0;
      ref.read(verifyOTPNotifier).restartTimer();
    } else {
      showSnackBar(message: response['error']);
    }
  }

  verifyUser() async {
    final response = await _repository.verifyUser(
        customerId: customerId, otp: _controller.text);
    if (response['status'] == success) {
      VerifyModel verifyModel = response['data'];
      SessionManager.setData(isLoggedIn, true);
      SessionManager.setData(
          userUid,
          verifyModel.customerId != null
              ? verifyModel.customerId.toString()
              : "");
      SessionManager.setData(userMobileNo, verifyModel.mobileno);
      // ignore: use_build_context_synchronously
      navigatorPushReplaceUntil(context, const DashboardScreen());
    } else {
      showSnackBar(message: response['error']);
    }
  }

  @override
  void initState() {
    super.initState();
    customerId = widget.customerId;
  }

  @override
  void dispose() {
    _controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(137, 146, 160, 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 64,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(70, 69, 66, 1),
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(24),
      ),
    );
    return Scaffold(
        body: InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(loginBgImg), fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: MyText(
                    text: "BUDGET",
                    fontSize: 29.sp,
                    color: redColor,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8.0,
              ),
              RichText(
                text: TextSpan(
                  text: '— ',
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'BAZAAR',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.sp,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: ' —',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyText(
                  text: 'Verify Otp',
                  color: commonTextColorDark,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formkey,
                child: Pinput(
                  length: 4,
                  controller: _controller,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.05999999865889549),
                          offset: Offset(0, 3),
                          blurRadius: 16,
                        )
                      ],
                    ),
                  ),
                  validator: (str) {
                    if (str?.trim().isEmpty == true) {
                      return "Code is required.";
                    } else if (str!.length < 4) {
                      return "Enter a valid Code";
                    } else {
                      return null;
                    }
                  },
                  showCursor: true,
                  cursor: cursor,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer(
                    builder: (context, ref, child) => PrimaryButton(
                      width: 38.w,
                      height: 47.0,
                      borderColor: Colors.green,
                      borderWidth: 3,
                      btnText: "Verify",
                      color: Colors.lightGreen,
                      textColor: white,
                      textSize: 16.sp,
                      isLoading: ref.watch(verifyLoadingStateProvider),
                      hasBorder: true,
                      cornerRadius: 24,
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          ref.read(verifyLoadingStateProvider.notifier).state =
                              !ref.read(verifyLoadingStateProvider);
                          await verifyUser();
                          ref.read(verifyLoadingStateProvider.notifier).state =
                              !ref.read(verifyLoadingStateProvider);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer(
                builder: ((context, ref, child) {
                  return Column(
                    children: [
                      if (ref.watch(verifyOTPNotifier).enableResend)
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Didn't receive the OTP? ",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: commonTextColorDark,
                              ),
                            ),
                            TextSpan(
                                text: " Resend again",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    bool isLoading =
                                        ref.read(verifyLoadingStateProvider);
                                    if (!isLoading) {
                                      ref
                                              .read(verifyLoadingStateProvider
                                                  .notifier)
                                              .state =
                                          !ref.read(verifyLoadingStateProvider);
                                      await loginUser(ref);

                                      ref
                                              .read(verifyLoadingStateProvider
                                                  .notifier)
                                              .state =
                                          !ref.read(verifyLoadingStateProvider);
                                    }
                                  }),
                          ]),
                        )
                      else
                        MyText(
                          text:
                              "Resend OTP in ${ref.watch(verifyOTPNotifier).secondsRemaining.toString()} seconds ",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: commonTextColorDark,
                        ),
                    ],
                  );
                }),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
