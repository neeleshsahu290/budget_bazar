// import 'package:flutter/material.dart';
// import 'package:jds_new/widget/my_text.dart';
// import 'package:jds_new/widget/ripple.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../constants/app_color.dart';

// class CustomExpansionTitle extends StatelessWidget {
//   const CustomExpansionTitle({super.key, this.children, this.title});

//   final List<Widget>? children;
//   final String? title;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
//       child: PhysicalModel(
//         borderRadius: BorderRadius.circular(12.0),
//         color: white,
//         elevation: 2,
//         shadowColor: blueColor,
//         child: ExpansionTile(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
//           title: MyText(
//             text: title ?? "",
//             color: commonTextColor,
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w500,
//           ),
//           children: children ?? [],
//         ),
//       ),
//     );
//   }
// }

// class CustomExpansionChild extends StatelessWidget {
//   final Function()? onClick;
//   final String? title;

//   const CustomExpansionChild({super.key, this.onClick, this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Ripple(
//       onTap: onClick,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Padding(
//               padding:
//                   const EdgeInsets.only(left: 15.0, bottom: 15.0, top: 15.0),
//               child: MyText(
//                 text: title ?? "",
//                 color: commonTextColor,
//                 textAlignment: TextAlign.start,
//                 fontSize: 15.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(right: 20.0),
//             child: Icon(
//               Icons.arrow_forward_ios,
//               size: 12.0,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
