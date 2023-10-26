// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:test_series_hub/constants/app_color.dart';
// import 'package:test_series_hub/constants/assets.dart';
// import 'package:test_series_hub/main.dart';
// import 'package:test_series_hub/widget/my_text.dart';

// class SnackbarWidget extends StatelessWidget {
//   final String message;
//   final Color darkColor;
//   final Color lightColor;
//   final String msgTitle;
//   SnackbarWidget(
//       {required this.darkColor,
//       required this.lightColor,
//       required this.msgTitle,
//       required this.message});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 25.0),
//             child: PhysicalModel(
//                 borderRadius: BorderRadius.circular(16.0),
//                 elevation: 2.0,
//                 color: lightColor,
//                 child: SizedBox(
//                     // height: 90.0,
//                     child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     children: [
//                       Align(
//                         alignment: Alignment.bottomLeft,
//                         child: SvgPicture.asset(
//                           bubbleIcon,
//                           height: 50.0,
//                           // ignore: deprecated_member_use
//                           color: darkColor,
//                           width: 50.0,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 20.0,
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             MyText(
//                                 text: msgTitle,
//                                 color: white,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 17.sp),
//                             MyText(
//                                 text: message.toString(),
//                                 color: white,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 15.sp),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ))),
//           ),
//           Positioned(
//             left: 15.0,
//             top: 0.0,
//             child: GestureDetector(
//               onTap: () {
//                 snackbarKey.currentState?.hideCurrentSnackBar();
//               },
//               child: Stack(
//                 children: [
//                   SvgPicture.asset(
//                     remarkBubbleIcon,
//                     // ignore: deprecated_member_use
//                     color: darkColor,
//                     height: 40.0,
//                     width: 40.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Center(
//                       child: SvgPicture.asset(
//                         closeIcon,
//                         height: 16.0,
//                         width: 16.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
