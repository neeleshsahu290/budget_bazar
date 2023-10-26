// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/screens/home/model/products_unit_type_list.dart';
import 'package:jds_new/widget/custom_container.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<bool?> customAlertDialog({
  required String message,
  required BuildContext context,
  required String title,
  FontWeight? messageFontWeight,
}) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
              alignment: Alignment.center,
              child: MyText(
                fontSize: 16.sp,
                color: commonTextColorDark,
                fontWeight: messageFontWeight ?? FontWeight.w600,
                text: title.toString(),
                textAlignment: TextAlign.center,
              )),
        ],
      ),
      content: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
              alignment: Alignment.center,
              child: MyText(
                fontSize: 15.sp,
                color: commonTextColor,
                fontWeight: messageFontWeight ?? FontWeight.w500,
                text: message.toString(),
                textAlignment: TextAlign.center,
              )),
        ],
      ),
      alignment: Alignment.center,
      actions: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  height: 45.0,
                  btnText: 'Cancel',
                  textColor: commonTextColor,
                  disablePadding: true,
                  color: buttonBackgroundGrey,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                child: PrimaryButton(
                  onPressed: () => Navigator.pop(context, true),
                  height: 45.0,
                  disablePadding: true,
                  btnText: 'confirm',
                  textColor: white,
                  color: colorPrimary,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Future<int?> selectDilog(BuildContext context,
    {required List<ProductsUnitTypeList> list, required String name}) async {
  return showDialog<int>(
    useSafeArea: false,
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
      insetAnimationDuration: const Duration(milliseconds: 800),
      insetAnimationCurve: Curves.easeInOutCirc,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                MyText(text: "Avaliable Quantities For"),
                const SizedBox(
                  height: 10.0,
                ),
                MyText(
                    text: name,
                    fontSize: 17.sp,
                    color: commonTextColorDark,
                    fontWeight: FontWeight.w600),
                const SizedBox(
                  height: 10.0,
                ),
                Wrap(
                    alignment: WrapAlignment.center,
                    children: List.generate(
                        list.length,
                        (index) => InkWell(
                              onTap: () {
                                Navigator.pop(context, index);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MyText(
                                        text: list[index].unitTypeName ?? "",
                                        fontSize: 16.sp,
                                        color: commonTextColor),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    MyText(
                                        decoration: TextDecoration.lineThrough,
                                        text: "${list[index].unitTypeMrp} ₹",
                                        fontSize: 16.sp,
                                        color: commonTextColor),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    MyText(
                                        text: "${list[index].unitTypePrice} ₹",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: commonTextColorDark),
                                  ],
                                ),
                              ),
                            ))),
                const SizedBox(
                  height: 15.0,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
