import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/screens/home/model/popular_products_list.dart';
import 'package:jds_new/screens/home/model/products_unit_type_list.dart';
import 'package:jds_new/screens/home/ui/home_screen.dart';
import 'package:jds_new/screens/product_details/ui/product_details.dart';
import 'package:jds_new/widget/custom_aleart_dialog.dart';
import 'package:jds_new/widget/custom_container.dart';
import 'package:jds_new/widget/custom_image_view.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PopularProducts extends ConsumerWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: MyText(
            text: "Popular Products",
            color: commonTextColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 20.0,
                ),
                Wrap(
                    spacing: 15.0,
                    children: ref
                            .watch(homeScreenProvider)
                            .popularProductsList
                            .isNotEmpty
                        ? List.generate(
                            ref
                                .watch(homeScreenProvider)
                                .popularProductsList
                                .length,
                            (index) => itemWidget(context,
                                index: index,
                                ref: ref,
                                item: ref
                                    .watch(homeScreenProvider)
                                    .popularProductsList[index]))
                        : List.generate(
                            3,
                            (index) => PhysicalModel(
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.grey.shade300,
                                // ignore: prefer_const_constructors
                                child: SizedBox(
                                  width: 50.w,
                                  height: 80.w,
                                ))))
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget itemWidget(BuildContext context,
      {required PopularProductsList item,
      required WidgetRef ref,
      required int index}) {
    return PhysicalModel(
      elevation: 0.5,
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
          width: 50.w,
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
                text: item.name?.trim() ?? "",
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
                text: item.description?.trim() ?? "",
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
                ? Column(
                    children: [
                      PriceBar(
                          onclick: () async {
                            var value = await selectDilog(context,
                                list: item.productsUnitTypeList ?? [],
                                name: item.name ?? "");

                            if (value != null) {
                              ref
                                  .read(homeScreenProvider)
                                  .changeProductSelect(index, value);
                            }
                          },
                          item: item.productsUnitTypeList![item.currentIndex]),
                    ],
                  )
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

class PriceBar extends StatelessWidget {
  final ProductsUnitTypeList item;
  final Function()? onclick;
  final bool isSelction;

  const PriceBar(
      {super.key, required this.item, this.onclick, this.isSelction = true});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isSelction
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  onClick: onclick,
                  horizontalPadding: 4.0,
                  radius: 6.0,
                  width: double.infinity,
                  verticalPadding: 2.0,
                  hasBorder: true,
                  borderColor: colorPrimary,
                  borderWidth: 2.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: colorPrimary,
                          textMaxLines: 1,
                          text: item.unitTypeName ?? ""),
                      const Icon(
                        Icons.arrow_downward,
                        color: colorPrimary,
                        size: 20.0,
                      )
                    ],
                  ),
                ),
              )
            : SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MyText(
            text: "Flat ${item.unitTypeDiscount}% off",
            color: colorPrimary,
            fontSize: 14.sp,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              MyText(
                text: "${item.unitTypePrice} ₹",
                color: commonTextColorDark,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                width: 10.0,
              ),
              MyText(
                text: "${item.unitTypeMrp} ₹",
                color: commonTextColor,
                fontSize: 15.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//Widget subItem() {}
