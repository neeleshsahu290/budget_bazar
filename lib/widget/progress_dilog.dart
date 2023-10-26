import 'package:flutter/material.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void progressDialog(BuildContext context, {required String text}) {
  showDialog<String>(
    context: context,
    barrierColor: Colors.black38,
    barrierDismissible: false,
    builder: (BuildContext context) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              12.0,
            ),
          ),
        ),
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    const SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: CircularProgressIndicator(),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    MyText(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      text: text,
                      textAlignment: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
  );
}
