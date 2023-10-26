// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:test_series_hub/constants/app_color.dart';
// import 'package:test_series_hub/screens/test_screen/model/sec_model.dart';

// // ignore: must_be_immutable
// class CustomDropDown extends StatelessWidget {
//   SecModel selectedValue;
//   Function(SecModel?)? onChanged;

//   CustomDropDown(
//       {super.key,
//       required this.selectedValue,
//       required this.onChanged,
//       required this.items});

//   final List<SecModel> items;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 88.w,
//       height: 56.0,
//       child: Scaffold(
//         body: DropdownButtonHideUnderline(
//           child: DropdownButton2<SecModel>(
//             isExpanded: true,
//             items: items
//                 .map((item) => DropdownMenuItem(
//                       value: item,
//                       child: Text(
//                         item.secName,
//                         style: const TextStyle(
//                           color: commonTextColorDark,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ))
//                 .toList(),
//             value: selectedValue,
//             onChanged: onChanged,
//             buttonStyleData: ButtonStyleData(
//               height: 55,
//               width: 100.w,
//               // padding: const EdgeInsets.only(left: 8, right: 8),
//               decoration: const BoxDecoration(
//                 // borderRadius: BorderRadius.circular(8),
//                 // border: Border.all(
//                 //   color: Colors.black38,
//                 // ),
//                 color: white,
//               ),
//               elevation: 0,
//             ),
//             style: const TextStyle(
//               fontSize: 16,
//               color: white,
//             ),
//             iconStyleData: const IconStyleData(iconEnabledColor: blackColor),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class CustomDropDownRes extends StatelessWidget {
//   SecModelSolution selectedValue;
//   Function(SecModelSolution?)? onChanged;

//   CustomDropDownRes(
//       {super.key,
//       required this.selectedValue,
//       required this.onChanged,
//       required this.items});

//   final List<SecModelSolution> items;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 88.w,
//       height: 56.0,
//       child: Scaffold(
//         body: DropdownButtonHideUnderline(
//           child: DropdownButton2<SecModelSolution>(
//             isExpanded: true,
//             items: items
//                 .map((item) => DropdownMenuItem(
//                       value: item,
//                       child: Text(
//                         item.secName,
//                         style: const TextStyle(
//                           color: commonTextColorDark,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ))
//                 .toList(),
//             value: selectedValue,
//             onChanged: onChanged,
//             buttonStyleData: ButtonStyleData(
//               height: 55,
//               width: 100.w,
//               decoration: const BoxDecoration(
//                 color: white,
//               ),
//               elevation: 0,
//             ),
//             style: const TextStyle(
//               fontSize: 16,
//               color: white,
//             ),
//             iconStyleData: const IconStyleData(iconEnabledColor: blackColor),
//           ),
//         ),
//       ),
//     );
//   }
// }
