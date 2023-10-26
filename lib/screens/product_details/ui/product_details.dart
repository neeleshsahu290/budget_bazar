// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/provider/product_details_notifier.dart';
import 'package:jds_new/screens/home/widgets/popular_products.dart';
import 'package:jds_new/screens/home/widgets/slider.dart';
import 'package:jds_new/screens/product_details/model/product_data.dart';
import 'package:jds_new/screens/shopping_cart/ui/shopping_cart_screen.dart';
import 'package:jds_new/widget/custom_aleart_dialog.dart';
import 'package:jds_new/widget/custom_app_bar.dart';
import 'package:jds_new/widget/custom_container.dart';
import 'package:jds_new/widget/empty_view.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_button.dart';
import 'package:jds_new/widget/progress_dilog.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final productDetailsProvider =
    ChangeNotifierProvider.autoDispose<ProductDetailsNotifier>((ref) {
  return ProductDetailsNotifier();
});

// ignore: must_be_immutable

final indexCountProvider = StateProvider.autoDispose<int>((ref) {
  return 1;
});

// final indexQuantrovider = StateProvider.autoDispose<int>((ref) {
//   return 1;
// });

// ignore: must_be_immutable
class ProductDetailsScreen extends ConsumerStatefulWidget {
  int productId;
  String name;
  ProductDetailsScreen(
      {super.key, required this.name, required this.productId});

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  getCartData({
    var isRefreshing = false,
  }) async {
    ref.read(productDetailsProvider).getProductData(
        isRefreshing: isRefreshing, productId: widget.productId);
  }

  @override
  void initState() {
    super.initState();
    getCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.name,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ref.watch(productDetailsProvider).productData.when(
            data: ((data) {
              ProductData mData = data;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 4),
                            enableInfiniteScroll: true,
                            viewportFraction: 1.0,
                            onPageChanged: (index, reason) {
                              ref.read(indexprovider.notifier).state = index;
                            },
                          ),
                          items: (mData.sliderGallery ?? [])
                              .map((item) => Center(
                                      child: SliderImageView(
                                    url: item.photo ?? "",
                                  )))
                              .toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: PhysicalModel(
                            color: white,
                            elevation: 0.5,
                            borderRadius: BorderRadius.circular(12.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: MyText(
                                          text: mData.name?.trim() ?? "",
                                          fontWeight: FontWeight.w600,
                                          color: commonTextColorDark,
                                          fontSize: 18.sp),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    mData.productsUnitTypeList != null &&
                                            mData.productsUnitTypeList!
                                                .isNotEmpty
                                        ? PriceBar(
                                            isSelction: false,
                                            item: mData.productsUnitTypeList![
                                                ref
                                                    .watch(
                                                        productDetailsProvider)
                                                    .currentIndex])
                                        : const SizedBox.shrink(),
                                    Html(data: mData.description ?? ""),
                                    mData.productsUnitTypeList != null &&
                                            mData.productsUnitTypeList!
                                                .isNotEmpty
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomContainer(
                                              onClick: () async {
                                                var value = await selectDilog(
                                                    context,
                                                    list: mData
                                                            .productsUnitTypeList ??
                                                        [],
                                                    name: mData.name ?? "");

                                                if (value != null) {
                                                  ref
                                                      .read(
                                                          productDetailsProvider)
                                                      .changeQuantSelect(value);
                                                }
                                              },
                                              horizontalPadding: 4.0,
                                              radius: 6.0,
                                              width: double.infinity,
                                              verticalPadding: 2.0,
                                              hasBorder: true,
                                              borderColor: colorPrimary,
                                              borderWidth: 2.0,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  MyText(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: colorPrimary,
                                                      textMaxLines: 1,
                                                      text: mData
                                                              .productsUnitTypeList![ref
                                                                  .watch(
                                                                      productDetailsProvider)
                                                                  .currentIndex]
                                                              .unitTypeName ??
                                                          ""),
                                                  const Icon(
                                                    Icons.arrow_downward,
                                                    color: colorPrimary,
                                                    size: 20.0,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomAddButton(
                                          size: 7.w,
                                          iconSize: 4.w,
                                          isForAdd: true,
                                          onClick: () {
                                            ref
                                                .read(
                                                    indexCountProvider.notifier)
                                                .state = ref
                                                    .read(indexCountProvider) +
                                                1;
                                          },
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        MyText(
                                          text: ref
                                              .watch(indexCountProvider)
                                              .toString(),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        CustomAddButton(
                                          onClick: () {
                                            if (ref.read(indexCountProvider) !=
                                                1) {
                                              ref
                                                      .read(indexCountProvider
                                                          .notifier)
                                                      .state =
                                                  ref.read(indexCountProvider) -
                                                      1;
                                            }
                                          },
                                          size: 7.w,
                                          iconSize: 4.w,
                                          isForAdd: false,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    )
                                  ]),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  PrimaryButton(
                    btnText: ref.watch(productDetailsProvider).isAdded
                        ? " View Cart"
                        : "Add to Cart",
                    color: colorPrimary,
                    onPressed: () async {
                      bool isAdded = ref.read(productDetailsProvider).isAdded;
                      if (isAdded) {
                        navigatorPush(context, const ShoppingCartScreen());
                      } else {
                        progressDialog(context, text: "Processing...");
                        await ref.read(productDetailsProvider).addProductToCart(
                            quant: ref.read(indexCountProvider));
                        Navigator.pop(context);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  )
                ],
              );
            }),
            error: ((error, stackTrace) => ErrorView(
                  message: error.toString(),
                  onReload: () {
                    getCartData(isRefreshing: true);
                  },
                )),
            loading: (() => const Center(
                  child: CircularProgressIndicator(),
                )),
          ),
    );
  }
}
