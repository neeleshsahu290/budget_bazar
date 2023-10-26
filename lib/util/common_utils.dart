import 'package:flutter/material.dart';
import 'package:jds_new/main.dart';
import '../widget/my_text.dart';
import '../widget/ripple.dart';

showProgressDialog(context, {Widget? child}) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: child ?? const CircularProgressIndicator(),
        ),
      ),
    ),
  );
}

showLoaderDialog(BuildContext context, var msg) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: MyText(
              text: msg,
            ),
          ),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(onWillPop: () => Future.value(false), child: alert);
    },
  );
}

showCustomDialog(context, {message, onClose}) {
  showDialog(
    context: context,
    builder: (context) => Center(
      child: Container(
        margin: const EdgeInsets.all(24.0),
        width: double.infinity,
        height: 220.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SvgPicture.asset(Assets.keyIcon, width: 72.0, height: 72.0),
                  const SizedBox(height: 24.0),
                  MyText(
                    text: message,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    textAlignment: TextAlign.center,
                  )
                ],
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Ripple(
                onTap: onClose,
                child: const Icon(
                  Icons.close_rounded,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

///Show a snackbar without context
showSnackBar({required var message}) {
  final SnackBar snackBar = SnackBar(
    content: Text(message.toString()),
  );
  snackbarKey.currentState?.showSnackBar(snackBar);
}

// showSnackBar({required var message}) {
//   final SnackBar snackBar = SnackBar(
//     backgroundColor: Colors.transparent,
//     elevation: 0.0,
//     behavior: SnackBarBehavior.floating,
//     content: SnackbarWidget(msgTitle: "Msg Recieved",darkColor:Color(0xFF5691E9) ,lightColor:Color.fromARGB(255, 35, 91, 175) ,message: message.toString()),
//   );
//   snackbarKey.currentState?.showSnackBar(snackBar);
// }
// showErrorSnackBar({required var message}) {
//   final SnackBar snackBar = SnackBar(
//     backgroundColor: Colors.transparent,
//     elevation: 0.0,
//     behavior: SnackBarBehavior.floating,
//     content: SnackbarWidget(msgTitle: "Oh snap!",darkColor:Color.fromARGB(255, 190, 34, 22) ,lightColor:Color.fromARGB(255, 228, 83, 72) ,message: message.toString()),
//   );
//   snackbarKey.currentState?.showSnackBar(snackBar);
// }

// showErrorDilog(BuildContext context, error) {
//   showDialog(
//     barrierColor: Colors.transparent,
//     context: context,
//     builder: (context) {
//       return FutureBuilder(
//         future: Future.delayed(Duration(seconds: 10)).then((value) => true),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             Navigator.of(context).pop();
//           }

//           return Align(
//             alignment: Alignment.bottomCenter,
//             child: AlertDialog(
//               alignment: Alignment.bottomCenter,
//               backgroundColor: Colors.transparent,
//               content: MyText(
//                 text: error.toString(),
//                 color: Colors.red,
//                 textAlignment: TextAlign.center,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16.sp,
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }

// showToast(
//   message, {
//   gravity = ToastGravity.BOTTOM,
//   length = Toast.LENGTH_LONG,
//   backgroundColor = Colors.black,
//   textColor = Colors.white,
//   double? textSize,
// }) {
//   return Fluttertoast.showToast(
//       msg: message ?? "",
//       toastLength: length,
//       gravity: gravity,
//       timeInSecForIosWeb: 1,
//       backgroundColor: backgroundColor,
//       textColor: textColor,
//       fontSize: textSize ?? 14.0);
// }

void removeFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
