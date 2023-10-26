// import 'package:jds_application/AppHandler/ApiHandler.dart';
// import 'package:jds_application/AppHandler/StorageManager.dart';
// import 'package:jds_application/OrderHistory/OrderHistory.dart';
// import 'package:jds_application/WebViewScreen.dart';
// import 'package:jds_application/user_details/EditScreenView.dart';
// import 'package:jds_application/user_details/customer_details_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/helper/session_manager.dart';
import 'package:jds_new/screens/login/ui/login.dart';
import 'package:jds_new/widget/custom_aleart_dialog.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/web_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  // var _isloading = false;
  //? customerDetailsModel;

  // @override
  // void initState() {
  //   getUserDetails();
  //   super.initState();
  // }

  // void getUserDetails() async {
  //   setState(() {
  //     _isloading = true;
  //   });
  //   var userId = await StorageManager.readString("userId");
  //   String deviceid = ApiHandler.shared.deviceId;
  //   Map<String, String> productParams = {
  //     "customer_id": userId == null ? "" : userId.toString(),
  //     "device_id": deviceid
  //   };
  //   ApiHandler.shared
  //       .postApiCall(ApiHandler.customerdetails, productParams)
  //       .then((value) {
  //     setState(() {
  //       _isloading = false;
  //     });
  //     var response = CustomerDetailsModel.fromJson(jsonDecode(value.body));
  //     if (response.status == "success") {
  //       customerDetailsModel = response;
  //     } else {}
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            padding:
                const EdgeInsets.only(top: 0, left: 8, right: 8, bottom: 0),
            // color: HexColor("#31343E"),
            color: Colors.redAccent,
            child: Row(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child:
                        //  _isloading == true
                        //     ?

                        const Icon(
                      Icons.account_circle,
                      size: 80,
                      color: Colors.white,
                    )
                    // : customerDetailsModel == null ||
                    //         customerDetailsModel?.results?.first.photo == ""
                    //     ? const Icon(
                    //         Icons.account_circle,
                    //         size: 80,
                    //         color: Colors.white,
                    //       )
                    //     : Image.network(
                    //         customerDetailsModel?.results?.first.photo ?? "",
                    //         height: 75,
                    //         width: 75,
                    //         fit: BoxFit.cover),
                    ),
                const SizedBox(
                  width: 10,
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Flexible(
                //       child: Text(
                //         _isloading
                //             ? "Loading..."
                //             : customerDetailsModel == null ||
                //                     customerDetailsModel?.results?.first.name ==
                //                         ""
                //                 ? "Username"
                //                 : (customerDetailsModel?.results?.first.name ??
                //                     ""),
                //         style: const TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontFamily: 'Montserrat',
                //             color: Colors.white),
                //       ),
                //     ),
                //     Flexible(
                //       child: Text(
                //         _isloading
                //             ? "Loading..."
                //             : customerDetailsModel == null ||
                //                     customerDetailsModel
                //                             ?.results?.first.emailid ==
                //                         ""
                //                 ? "Phone Number"
                //                 : (customerDetailsModel
                //                         ?.results?.first.mobileno ??
                //                     ""),
                //         style: const TextStyle(
                //             fontFamily: 'Montserrat', color: Colors.white),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
          const Divider(
            color: Colors.transparent,
          ),
          SessionManager.getBool(isLoggedIn)
              ? Column(
                  children: [
                    // itemDrawer(
                    //   icon: Icons.shopping_cart,
                    //   name: "My Orders",
                    //   onClick: () {},
                    // ),
                    // itemDrawer(
                    //   icon: Icons.person,
                    //   name: "Edit Profile",
                    //   onClick: () {},
                    // ),
                    itemDrawer(
                      icon: Icons.group,
                      name: "About Us",
                      onClick: () {
                        Navigator.pop(context);
                        navigatorPush(
                            context,
                            WebView(
                              appbarTitle: "About Us",
                              url: aboutUs,
                            ));
                      },
                    ),
                    itemDrawer(
                      icon: Icons.support_agent,
                      name: "Support",
                      onClick: () {
                        Navigator.pop(context);

                        navigatorPush(
                            context,
                            WebView(
                              appbarTitle: "Support",
                              url: contactUs,
                            ));
                      },
                    ),
                    itemDrawer(
                      icon: Icons.money_off,
                      name: "Refund",
                      onClick: () {
                        Navigator.pop(context);

                        navigatorPush(
                            context,
                            WebView(
                              appbarTitle: "Refund",
                              url: refund,
                            ));
                      },
                    ),
                    itemDrawer(
                      icon: Icons.policy,
                      name: "Terms and Conditions",
                      onClick: () {
                        Navigator.pop(context);

                        navigatorPush(
                            context,
                            WebView(
                              appbarTitle: "Terms and Conditions",
                              url: termsAndConditions,
                            ));
                      },
                    ),
                    itemDrawer(
                      icon: Icons.logout,
                      name: "Logout",
                      onClick: () async {
                        var value = await customAlertDialog(
                            message: "Do you want to logout",
                            context: context,
                            title: "Are you sure");
                        if (value == true) {
                          SessionManager.clearDataAndLogout();
                          navigatorPush(context, Loginpage());
                        }
                      },
                    )
                  ],
                )
              : Column(
                  children: [
                    itemDrawer(
                      iconWidget: const FaIcon(
                        FontAwesomeIcons.rightToBracket,
                        color: Colors.black,
                      ),
                      //icon: Icons.login,
                      name: "Login",
                      onClick: () {
                        Navigator.pop(context);
                        navigatorPush(context, const Loginpage());
                      },
                    )
                  ],
                ),
        ],
      ),
    );
  }

  itemDrawer(
      {required String name,
      IconData? icon,
      Widget? iconWidget,
      required Function()? onClick}) {
    return ListTile(
      dense: true,
      title: MyText(
        text: name,
        color: commonTextColorDark,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ),
      leading: icon != null
          ? Icon(
              icon,
              color: Colors.black,
            )
          : (iconWidget),
      onTap: onClick,
    );
  }
}
