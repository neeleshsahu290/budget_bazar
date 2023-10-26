import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/screens/categories/ui/categories_screen.dart';
import 'package:jds_new/screens/home/model/products_main_category_list.dart';
import 'package:jds_new/screens/home/ui/home_screen.dart';
import 'package:jds_new/widget/custom_image_view.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesHome extends ConsumerWidget {
  const CategoriesHome({super.key});

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
            text: "Our Categories",
            color: commonTextColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 20.0,
              ),
              Wrap(
                  spacing: 15.0,
                  children: ref
                          .watch(homeScreenProvider)
                          .productsMainCategoryList
                          .isNotEmpty
                      ? List.generate(
                          ref
                              .watch(homeScreenProvider)
                              .productsMainCategoryList
                              .length,
                          (index) => itemWidget(context,
                              item: ref
                                  .watch(homeScreenProvider)
                                  .productsMainCategoryList[index]))
                      : List.generate(
                          3,
                          (index) => PhysicalModel(
                              elevation: 2.0,
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.grey.shade300,
                              // ignore: prefer_const_constructors
                              child: SizedBox(
                                width: 120.0,
                                height: 140.0,
                              ))))
            ],
          ),
        )
      ],
    );
  }

  Widget itemWidget(BuildContext context,
      {required ProductsMainCategoryList item}) {
    return PhysicalModel(
      elevation: 0.5,
      borderRadius: BorderRadius.circular(8.0),
      color: colorPrimary,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            minHeight: 135, maxWidth: 120.0, minWidth: 120.0),
        child: GestureDetector(
          onTap: () {
            navigatorPush(
                context,
                CategoriesScreen(
                    name: item.name ?? "",
                    productCatId: item.productsCategoryId ?? 0,
                    productMainCatId: item.productsMainCategoryId ?? 0));
          },
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomImageView(
                cornerRadius: 2.0,
                url: item.photo ?? "",
                fallBackText: "",
                height: 60.0,
                width: 100.0,
              ),
            ),
            // SizedBox(
            //   height: 10.0,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyText(
                fontWeight: FontWeight.w600,
                text: item.name ?? "",
                fontSize: 17.sp,
                textAlignment: TextAlign.center,
                color: white,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
