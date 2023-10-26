// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/constants/assets.dart';
import 'package:jds_new/util/utils.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_button.dart';
import 'package:jds_new/widget/primary_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

  void getlogindata() {
    // String deviceid = ApiHandler.shared.deviceId;
    // Map<String, String> phoneNumberMap = {
    //   "mobileno": mobileNumController.text,
    //   "device_id": deviceid
    // };
    // ApiHandler.shared
    //     .postApiCall(ApiHandler.customerlogin, phoneNumberMap)
    //     .then((value) {
    //   var response = LoginModel.fromJson(jsonDecode(value.body));
    //   setState(() {
    //     _isloading = false;
    //   });
    //   if (response.status == "success") {
    //     Fluttertoast.showToast(
    //         msg: response.messageDev ?? "",
    //         toastLength: Toast.LENGTH_LONG,
    //         gravity: ToastGravity.TOP_LEFT,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.grey[200],
    //         textColor: Colors.black,
    //         fontSize: 16.0);
    //     Get.off(Verify(customer_id: response.results?.first.customerId));
    //   } else {
    //     Fluttertoast.showToast(
    //         msg: response.messageDev ?? "",
    //         toastLength: Toast.LENGTH_LONG,
    //         gravity: ToastGravity.TOP_LEFT,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.grey[200],
    //         textColor: Colors.black,
    //         fontSize: 16.0);
    //   }
    // });
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
                  text: 'Register',
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
                  controller: _mobileNumController,
                  backgroundColor: Colors.transparent,
                  inputType: TextInputType.number,
                  hasContentPadding: false,
                  radius: 20.0,
                  hintText: "Enter mobile",
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
                  PrimaryButton(
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
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {}
                    },
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
                    text: 'Already Registered?',
                    color: commonTextColorDark,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: MyText(
                      text: ' Login',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
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
