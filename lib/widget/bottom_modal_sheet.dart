import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import 'primary_button.dart';

class BottomModalSheet {
  static void logoutConfirmBottomSheet(context, onConfirm) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: Text(
                    'Are you sure you want to log out?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: MaterialButton(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      color: Colors.grey[100],
                      colorBrightness: Brightness.light,
                      elevation: 2,
                      highlightElevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      onPressed: () {
                        //Do something
                        Navigator.pop(context);
                      },
                      child: Text('Cancel',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.black)),
                    )),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        color: colorPrimary,
                        colorBrightness: Brightness.dark,
                        highlightElevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          onConfirm();
                        },
                        child: Text(
                          'Log Out',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                )
              ],
            ),
          );
        });
  }

  static void confirmBottomSheet(context, message,
      {confirmText = "Confirm",
      onConfirm,
      cancelText = "Cancel",
      onCancel,
      bool isCancellable = false}) {
    showModalBottomSheet<void>(
        context: context,
        isDismissible: isCancellable,
        enableDrag: isCancellable,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        ),
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return isCancellable;
            },
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          color: colorPrimary,
                          highlightElevation: 12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            if (onConfirm != null) onConfirm();
                          },
                          child: Text(
                            confirmText,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: MaterialButton(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        color: Colors.grey[100],
                        colorBrightness: Brightness.light,
                        elevation: 2,
                        highlightElevation: 12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        onPressed: () {
                          //Do something
                          Navigator.pop(context);
                          if (onCancel != null) onCancel();
                        },
                        child: Text(
                          cancelText,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14.0),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  static Future<bool?>? customChildSheet(context, child,
      {isCancelable = true, horizontalPadding = 16.0, verticalPadding = 16.0}) {
    return showModalBottomSheet<bool?>(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: isCancelable,
        enableDrag: isCancelable,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async {
                return isCancelable;
              },
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                              vertical: verticalPadding),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                24.0,
                              ),
                            ),
                          ),
                          child: child),
                    ]),
              ));
        });
  }

  static void openOkActionSheet(context, message,
      {okButtonText = "Ok", isCancelable = true, okClickListener}) {
    showModalBottomSheet<void>(
        enableDrag: isCancelable,
        context: context,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        ),
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async {
                return isCancelable;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: white),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(18.0),
                            topLeft: Radius.circular(18.0)),
                        color: white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Text(
                            message ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        PrimaryButton(
                          btnText: okButtonText,
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.pop(context);
                            okClickListener();
                          },
                        ),
                        const SizedBox(
                          height: 18.0,
                        )
                      ],
                    ),
                  ),
                ],
              ));
        });
  }

  static void okBottomSheet(context, message, {isCancelable = true}) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
        ),
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async {
                return isCancelable;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: white),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(18.0),
                            topLeft: Radius.circular(18.0)),
                        color: white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 24.0, horizontal: 16.0),
                          child: Text(
                            message ?? "",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        PrimaryButton(
                          btnText: "Okay",
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        )
                      ],
                    ),
                  ),
                ],
              ));
        });
  }

  static showCustomBottomSheet(BuildContext context,
      {required Widget child,
      bool isCancelable = true,
      horizontalPadding = 16.0,
      verticalPadding = 16.0,
      double maxChildSize = 1.0}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: isCancelable,
      enableDrag: isCancelable,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.2,
          maxChildSize: maxChildSize,
          expand: false,
          builder: (_, controller) {
            return WillPopScope(
              onWillPop: () => Future.value(isCancelable),
              child: SingleChildScrollView(
                controller: controller,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: verticalPadding),
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 5.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: lightGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      child
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
