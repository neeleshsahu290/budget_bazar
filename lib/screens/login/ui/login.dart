// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/constants/assets.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/repository/base_repository.dart';
import 'package:jds_new/screens/dashboard/ui/dashboard_screen.dart';
import 'package:jds_new/screens/login/model/login_model.dart';
import 'package:jds_new/screens/login/ui/register.dart';
import 'package:jds_new/screens/login/ui/verify_otp.dart';
import 'package:jds_new/util/common_utils.dart';
import 'package:jds_new/util/utils.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_button.dart';
import 'package:jds_new/widget/primary_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// final currentIndexNotifier = StateProvider<int>((ref) {
//   return 0;
// });

final loadingStateProvider = StateProvider<bool>((ref) {
  return false;
});

class Loginpage extends StatefulWidget {
  const Loginpage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageLoginpageState createState() => _HomePageLoginpageState();
}

class _HomePageLoginpageState extends State<Loginpage> {
  late TextEditingController _mobileNumController;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _mobileNumController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final Repository _repository = Repository();

  loginUser() async {
    final response =
        await _repository.loginUser(mobileNo: _mobileNumController.text);
    if (response['status'] == success) {
      var (String message, LoginModel loginModel) = response['data'];

      showSnackBar(message: message);
      // ignore: use_build_context_synchronously
      navigatorPush(
          context,
          VerifyOtpScreen(
            customerId: loginModel.customerId ?? 0,
            mobileNo: _mobileNumController.text,
          ));
    } else {
      showSnackBar(message: response['error']);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          //  fontFamily: 'Montserrat',
                          fontSize: 20.sp,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: ' —',
                      style: TextStyle(
                          // fontFamily: 'Montserrat',
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
                  text: 'Log In',
                  color: commonTextColorDark,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: PrimaryTextField(
                  backgroundColor: Colors.transparent,
                  inputType: TextInputType.number,
                  hasContentPadding: false,
                  isLabelReq: false,
                  radius: 20.0,
                  controller: _mobileNumController,
                  hintText: "Enter register number",
                  validator: (str) {
                    if (str?.trim().isEmpty == true) {
                      return "Mobile No is required.";
                    } else if (!isValidPhone(str!)) {
                      return "Enter valid Mobile No";
                    } else {
                      return null;
                    }
                  },
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
                      isLoading: ref.watch(loadingStateProvider),
                      width: 38.w,
                      height: 47.0,
                      borderColor: Colors.green,
                      borderWidth: 3,
                      btnText: "Sign In",
                      color: Colors.lightGreen,
                      textColor: white,
                      textSize: 16.sp,
                      hasBorder: true,
                      cornerRadius: 24,
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          ref.read(loadingStateProvider.notifier).state =
                              !ref.read(loadingStateProvider);
                          await loginUser();
                          ref.read(loadingStateProvider.notifier).state =
                              !ref.read(loadingStateProvider);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: 'Not yet registered?',
                    color: commonTextColorDark,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorPush(context, const RegisterScreen());
                    },
                    child: MyText(
                      text: ' Register First',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    navigatorPush(context, const DashboardScreen());
                    // Get.offAll(() =>
                    //     BottomNavigationTab(selectedIndex: 0, customerid: ""));
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: MyText(
                      text: 'Continue As Guest?',
                      textAlignment: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          ),
        ],
      ),
    ));
  }
}
