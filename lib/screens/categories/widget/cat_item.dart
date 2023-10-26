import 'package:flutter/material.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/screens/categories/model/product_list.dart';
import 'package:jds_new/screens/home/widgets/popular_products.dart';
import 'package:jds_new/screens/product_details/ui/product_details.dart';
import 'package:jds_new/widget/custom_image_view.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CatItem extends StatelessWidget {
  final ProductList item;
  const CatItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(8.0),
      color: white,
      child: GestureDetector(
        onTap: () {
          navigatorPush(
              context,
              ProductDetailsScreen(
                  name: item.name ?? "", productId: item.productsId ?? 0));
        },
        child: SizedBox(
          width: 42.w,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomImageView(
                cornerRadius: 2.0,
                url: item.photo ?? "",
                fit: BoxFit.contain,
                fallBackText: "",
                height: 40.w,
                width: double.infinity,
                // width: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyText(
                fontWeight: FontWeight.w600,
                text: item.name ?? "",
                fontSize: 16.sp,
                textMaxLines: 1,
                textAlignment: TextAlign.start,
                color: commonTextColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MyText(
                fontWeight: FontWeight.w500,
                text: item.description ?? "",
                fontSize: 15.sp,
                textAlignment: TextAlign.start,
                color: commonTextGreyColor,
                textMaxLines: 2,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            item.productsUnitTypeList != null &&
                    item.productsUnitTypeList!.isNotEmpty
                ? PriceBar(item: item.productsUnitTypeList![item.currentIndex])
                : const SizedBox.shrink(),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
