import 'package:flutter/material.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/session_manager.dart';
import 'package:jds_new/screens/common/ui/not_logged_screen.dart';
import 'package:jds_new/widget/custom_app_bar.dart';
import 'package:jds_new/widget/custom_container.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Profile"),
        body: SessionManager.getBool(isLoggedIn)
            ? Column(
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: PhysicalModel(
                      color: white,
                      elevation: 0.5,
                      borderRadius: BorderRadius.circular(12.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(children: [
                          CustomContainer(
                            radius: 10.w,
                            height: 16.w,
                            width: 16.w,
                            color: Colors.red.shade100,
                            child: Center(
                                child: MyText(
                                    text: "W",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.sp)),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: "Welcome",
                                fontWeight: FontWeight.w600,
                                //    text: SessionManager.getString(userName),
                                color: commonTextColor,
                                fontSize: 17.sp,
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              // MyText(
                              //   text: "abcdef@gmail.com",
                              //   fontWeight: FontWeight.w500,
                              //   //  text: SessionManager.getString(userEmail),
                              //   color: commonTextColor,
                              //   fontSize: 16.sp,
                              // ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              MyText(
                                text: SessionManager.getString(userMobileNo),
                                fontWeight: FontWeight.w500,
                                //   text: SessionManager.getString(userMobileNo),
                                color: commonTextColor,
                                fontSize: 16.sp,
                              )
                            ],
                          ))
                        ]),
                      ),
                    ),
                  ),
                ],
              )
            : NotLoggedInScreen(
                callBack: (success) {},
              ));
  }
}
