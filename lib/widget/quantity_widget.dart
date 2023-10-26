// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:the_paper_boutique/constants/app_color.dart';
// import 'package:the_paper_boutique/widget/my_text.dart';

// // ignore: must_be_immutable
// class QuantityButton extends StatefulWidget {
//   int quantity;
//   Function(String)? onChanged;

//   QuantityButton({this.quantity = 1, this.onChanged});
//   @override
//   State<QuantityButton> createState() =>
//       _QuantityButtonState(quantity: quantity, onChanged: onChanged);
// }

// class _QuantityButtonState extends State<QuantityButton> {
//   Function(String)? onChanged;

//   ValueNotifier<String> _myString = ValueNotifier<String>('');

//   var _controller = TextEditingController();
//   int quantity = 1;
//   _QuantityButtonState({this.quantity = 1, this.onChanged});
//   @override
//   void initState() {
//     _myString.value = quantity.toString();
//     _myString.addListener(() => _controller.text = _myString.value);

//     _controller.text = quantity.toString();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         MyText(
//           text: "Qty",
//           fontSize: 15.sp,
//           color: colorPrimary,
//         ),
//         const SizedBox(
//           height: 4.0,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               height: 26.0,
//               width: 26.0,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: secondaryColor,
//                     padding: EdgeInsets.zero,
//                     textStyle: const TextStyle(
//                         fontSize: 30, fontWeight: FontWeight.bold)),
//                 onPressed: () {
//                   if (quantity > 1) {
//                     quantity = quantity - 1;
//                     _controller.text = quantity.toString();
//                     //   setState(() {});
//                   }
//                 },
//                 child: const Icon(
//                   Icons.remove,
//                   size: 16.0,
//                   color: white,
//                 ),
//               ),
//             ),
//             Card(
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(4.0))),
//               child: SizedBox(
//                 height: 26.0,
//                 width: 26.0,
//                 child: Center(
//                   child: EditableText(
//                     onChanged: onChanged,
//                     controller: _controller,

//                     textAlign: TextAlign.center,

//                     style: TextStyle(
//                       color: commonTextColorDark,
//                       fontSize: 16.0,
//                     ),
//                     backgroundCursorColor: white,
//                     cursorColor: white,
//                     focusNode: FocusNode(),

//                     // child: MyText(
//                     //   textAlignment: TextAlign.center,
//                     //   text: ref.watch(quantityProvider).toString(),
//                     //   color: commonTextColorDark,
//                     //   fontSize: 16.0,
//                     // ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 26.0,
//               width: 26.0,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: colorPrimary,
//                     padding: EdgeInsets.zero,
//                     textStyle: const TextStyle(
//                         fontSize: 30, fontWeight: FontWeight.bold)),
//                 onPressed: () {
//                   quantity = quantity + 1;

//                   _controller.text = quantity.toString();

//                   //  setState(() {});
//                 },
//                 child: const Icon(
//                   Icons.add,
//                   size: 16.0,
//                   color: white,
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

// // class QuantityButton2 extends StatefulWidget {
// //   int quantity;
// //   Function(String)? onChanged;

// //   QuantityButton({this.quantity = 1, this.onChanged});
// //   @override
// //   State<QuantityButton> createState() =>
// //       _QuantityButtonState(quantity: quantity, onChanged: onChanged);
// // }

// class QuantityButton2 extends StatelessWidget {
//   final TextEditingController controller;
//   final Function()? onAddPressed;
//   final  Function()? onRemovePress;
//   QuantityButton2({required this.controller, super.key,required this.onAddPressed,required this.onRemovePress});
//   // Function(String)? onChanged;

//   // ValueNotifier<String> _myString = ValueNotifier<String>('');

//   // var _controller = TextEditingController();
//   // int quantity = 1;
//   // _QuantityButtonState({this.quantity = 1, this.onChanged});
//   // @override
//   // void initState() {
//   //   _myString.value = quantity.toString();
//   //     _myString.addListener(() => _controller.text = _myString.value);

//   //   _controller.text = quantity.toString();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         MyText(
//           text: "Qty",
//           fontSize: 15.sp,
//           color: colorPrimary,
//         ),
//         const SizedBox(
//           height: 4.0,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               height: 26.0,
//               width: 26.0,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: secondaryColor,
//                     padding: EdgeInsets.zero,
//                     textStyle: const TextStyle(
//                         fontSize: 30, fontWeight: FontWeight.bold)),
//                 onPressed: onRemovePress,

//                 child: const Icon(
//                   Icons.remove,
//                   size: 16.0,
//                   color: white,
//                 ),
//               ),
//             ),
//             Card(
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(4.0))),
//               child: SizedBox(
//                 height: 26.0,
//                 width: 26.0,
//                 child: Center(
//                   child: EditableText(
//                     readOnly: true,

//                     controller: controller,

//                     textAlign: TextAlign.center,

//                     style: TextStyle(
//                       color: commonTextColorDark,
//                       fontSize: 16.0,
//                     ),
//                     backgroundCursorColor: white,
//                     cursorColor: white,
//                     focusNode: FocusNode(),

//                     // child: MyText(
//                     //   textAlignment: TextAlign.center,
//                     //   text: ref.watch(quantityProvider).toString(),
//                     //   color: commonTextColorDark,
//                     //   fontSize: 16.0,
//                     // ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 26.0,
//               width: 26.0,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: colorPrimary,
//                     padding: EdgeInsets.zero,
//                     textStyle: const TextStyle(
//                         fontSize: 30, fontWeight: FontWeight.bold)),
//                 onPressed: onAddPressed,
//                 child: const Icon(
//                   Icons.add,
//                   size: 16.0,
//                   color: white,
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
