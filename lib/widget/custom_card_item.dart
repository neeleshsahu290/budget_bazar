// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:test_series_hub/constants/app_color.dart';
// import 'package:test_series_hub/constants/assets.dart';
// import 'package:test_series_hub/widget/custom_container.dart';
// import 'package:test_series_hub/widget/custom_image_view.dart';
// import 'package:test_series_hub/widget/my_text.dart';
// import 'package:test_series_hub/widget/ripple.dart';

// // ignore: must_be_immutable
// class CustomCardItem extends StatelessWidget {
//   Function()? onclick;
//   Color contColor;
//   String title;
//   String icon;
//   double? width;
//   bool isSvg;
//   bool isonline;

//   CustomCardItem(
//       {super.key,
//       required this.contColor,
//       required this.title,
//       this.onclick,
//       required this.icon,
//       this.isSvg = false,
//       this.isonline = false,
//       this.width});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           const EdgeInsets.only(bottom: 14.0, left: 8.0, right: 8.0, top: 4.0),
//       child: PhysicalModel(
//         color: white,
//         elevation: 6,
//         shadowColor: blueColor,
//         borderRadius: BorderRadius.circular(20),
//         child: Ripple(
//           onTap: onclick,
//           child: SizedBox(
//             width: width ?? 42.w,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 22.0,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   isonline == false
//                       ? SizedBox(
//                           child: CustomContainer(
//                             radius: 12.0,
//                             color: contColor,
//                             height: 15.w,
//                             width: 15.w,
//                             verticalPadding: 12.0,
//                             horizontalPadding: 2.0,
//                             child: icon != ""
//                                 ? SvgPicture.asset(
//                                     icon,
//                                     // ignore: deprecated_member_use
//                                     color: white,
//                                   )
//                                 : const SizedBox.shrink(),
//                           ),
//                         )
//                       : SizedBox(
//                           child: CustomContainer(
//                             radius: 12.0,
//                             color: contColor,
//                             height: 15.w,
//                             width: 15.w,
//                             verticalPadding: 12.0,
//                             horizontalPadding: 2.0,
//                             child: isSvg
//                                 ? CustomSvgImageView(
//                                     url: icon,
//                                     fallBackText: 'fallBackText',
//                                     // ignore: deprecated_member_use
//                                   )
//                                 : CustomImageView(
//                                     fit: BoxFit.contain,
//                                     url: icon,
//                                     fallBackText: 'fallBackText'),
//                           ),
//                         ),
//                   const SizedBox(
//                     height: 15.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: MyText(
//                       text: title,
//                       textAlignment: TextAlign.center,
//                       fontWeight: FontWeight.w500,
//                       color: commonTextColor,
//                       fontSize: 14.0,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class CustomCardItemPng extends StatelessWidget {
//   Function()? onclick;
//   Color contColor;
//   String title;
//   String icon;
//   double? width;

//   CustomCardItemPng(
//       {super.key,
//       required this.contColor,
//       required this.title,
//       this.onclick,
//       required this.icon,
//       this.width});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           const EdgeInsets.only(bottom: 14.0, left: 4.0, right: 4.0, top: 4.0),
//       child: PhysicalModel(
//         color: white,
//         elevation: 6,
//         shadowColor: blueColor,
//         borderRadius: BorderRadius.circular(20),
//         child: Ripple(
//           onTap: onclick,
//           child: SizedBox(
//             width: width ?? 42.w,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 22.0,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     child: SizedBox(
//                       height: 15.w,
//                       width: 15.w,
//                       child: CustomImageView(
//                           fit: BoxFit.contain,
//                           url: icon,
//                           fallBackText: 'fallBackText'),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: MyText(
//                       text: title,
//                       textAlignment: TextAlign.center,
//                       fontWeight: FontWeight.w500,
//                       color: commonTextColor,
//                       fontSize: 14.0,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class CustomCardItemHoz extends StatelessWidget {
//   Function()? onclick;
//   Color contColor;
//   String title;
//   String icon;
//   // double? width;

//   CustomCardItemHoz({
//     super.key,
//     required this.contColor,
//     required this.title,
//     this.onclick,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           const EdgeInsets.only(bottom: 14.0, left: 8.0, right: 8.0, top: 4.0),
//       child: PhysicalModel(
//         color: white,
//         elevation: 6,
//         shadowColor: blueColor,
//         borderRadius: BorderRadius.circular(20),
//         child: Ripple(
//           onTap: onclick,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   CustomContainer(
//                     radius: 12.0,
//                     color: contColor,
//                     height: 15.w,
//                     width: 15.w,
//                     verticalPadding: 12.0,
//                     horizontalPadding: 2.0,
//                     child: icon != ""
//                         ? CustomSvgImageView(
//                             url: icon,
//                             fallBackText: '',
//                             // ignore: deprecated_member_use
//                           )
//                         : const SizedBox.shrink(),
//                   ),
//                   Positioned(
//                     left: 0.0,
//                     bottom: 0.0,
//                     child: CustomContainer(
//                       color: white,
//                       radius: 12.0,
//                       horizontalPadding: 2.0,
//                       verticalPadding: 2.0,
//                       height: 20.0,
//                       width: 20.0,
//                       // ignore: deprecated_member_use
//                       child: SvgPicture.asset(pdfIcon, color: colorPrimary),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 width: 6.0,
//               ),
//               SizedBox(
//                 height: 15.w,
//                 width: 25.w,
//                 child: Center(
//                   child: MyText(
//                     text: title.replaceAll(" ", "\n"),
//                     textAlignment: TextAlign.center,
//                     fontWeight: FontWeight.w500,
//                     color: commonTextColor,
//                     fontSize: 14.0,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
