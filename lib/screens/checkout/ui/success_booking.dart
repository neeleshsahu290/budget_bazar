// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/screens/dashboard/ui/dashboard_screen.dart';

class SuccessBooking extends StatefulWidget {
  //static const routeName = '/SuccessBooking';

  const SuccessBooking({super.key});
  @override
  _SuccessBookingState createState() => _SuccessBookingState();
}

class _SuccessBookingState extends State<SuccessBooking> {
  @override
  void initState() {
    //  SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/payment.gif",
              height: 200.0,
              width: 200.0,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
                "Order Placed Successfuly. \n Thank You for placing order.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              // When the child is tapped, show a snackbar.
              onTap: () async {
                navigatorPushReplaceUntil(context, const DashboardScreen());
                //   SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
                // var userId = await StorageManager.readString("userId");

                // Get.offAll(OrderHistory(
                //   isFormSuccess: true,
                //   customerId: userId ?? "",
                // ));
              },
              // The custom button
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Done",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
