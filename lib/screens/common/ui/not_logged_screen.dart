import 'package:flutter/material.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/constants/assets.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotLoggedInScreen extends StatelessWidget {
  final Function(bool success) callBack;
  const NotLoggedInScreen({Key? key, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                guestImg,
                width: 25.h,
                height: 25.h,
              ),
              // SizedBox(height: MediaQuery.of(context).size.height*0.01),
              const SizedBox(
                height: 20.0,
              ),
              MyText(
                fontSize: 17.sp,
                text: 'You are not logged in',
                color: commonTextColorDark,
                fontWeight: FontWeight.w600,
                textAlignment: TextAlign.center,
              ),
              const SizedBox(
                height: 15.0,
              ),

              MyText(
                text: 'Please login to continue',
                color: commonTextGreyColor,
                fontSize: 14.sp,
                textAlignment: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              PrimaryButton(
                width: 60.w,
                btnText: "Login",
                color: colorPrimary,
                onPressed: () {},
                textColor: white,
              ),
              const SizedBox(
                height: 40.0,
              )

              // SizedBox(
              //   width: 200,
              //   child: CustomButton(buttonText: 'login'.tr, height: 40, onPressed: () async {

              //     if(!ResponsiveHelper.isDesktop(context)) {
              //       await Get.toNamed(RouteHelper.getSignInRoute(Get.currentRoute));
              //     }else{
              //       Get.dialog(const SignInScreen(exitFromApp: true, backFromThis: true)).then((value) => callBack(true));
              //     }
              //     if(Get.find<OrderController>().showBottomSheet) {
              //       Get.find<OrderController>().showRunningOrders();
              //     }
              //     callBack(true);

              //   }),
              // ),
            ]),
      ),
    );
  }
}
