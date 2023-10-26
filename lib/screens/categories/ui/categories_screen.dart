import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/provider/category_screen_notifier.dart';
import 'package:jds_new/screens/categories/model/category_data.dart';
import 'package:jds_new/screens/categories/model/products_category_list.dart';
import 'package:jds_new/screens/categories/widget/cat_item.dart';
import 'package:jds_new/widget/custom_app_bar.dart';
import 'package:jds_new/widget/custom_image_view.dart';
import 'package:jds_new/widget/empty_view.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final categoryScreenProvider =
    ChangeNotifierProvider.autoDispose<CategoryScreenNotifier>((ref) {
  return CategoryScreenNotifier();
});

// ignore: must_be_immutable

final selectedIndexprovider = StateProvider.autoDispose<int>((ref) {
  return -1;
});

// ignore: must_be_immutable
class CategoriesScreen extends ConsumerStatefulWidget {
  int productCatId;
  int productMainCatId;

  String name;
  CategoriesScreen(
      {super.key,
      required this.name,
      required this.productCatId,
      required this.productMainCatId});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  getCatData({
    var isRefreshing = false,
  }) async {
    ref.read(categoryScreenProvider).getCategoryData(
        productMainCatId: widget.productMainCatId,
        isRefreshing: isRefreshing,
        productCatId: widget.productCatId);
  }

  @override
  void initState() {
    super.initState();
    getCatData();
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
      body: ref.watch(categoryScreenProvider).categoryData.when(
            data: ((data) {
              CategoryData mData = data;
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            mData.productsCategoryList != null &&
                                    mData.productsCategoryList!.isNotEmpty
                                ? Wrap(
                                    runSpacing: 12.0,
                                    spacing: 12.0,
                                    children: List.generate(
                                        mData.productsCategoryList!.length,
                                        (index) {
                                      ProductsCategoryList item =
                                          mData.productsCategoryList![index];

                                      return SizedBox(
                                        child: PhysicalModel(
                                          elevation: 2.0,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: ref.watch(
                                                      selectedIndexprovider) ==
                                                  index
                                              ? Colors.green
                                              : white,
                                          child: GestureDetector(
                                            onTap: () {
                                              ref
                                                  .read(selectedIndexprovider
                                                      .notifier)
                                                  .state = index;
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    CustomImageView(
                                                      url:
                                                          item.productsCategoryPhoto ??
                                                              "",
                                                      fallBackText:
                                                          "fallBackText",
                                                      height: 30.0,
                                                      width: 30.0,
                                                    ),
                                                    const SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    MyText(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15.sp,
                                                        color: ref.watch(
                                                                    selectedIndexprovider) ==
                                                                index
                                                            ? white
                                                            : commonTextColor,
                                                        text:
                                                            item.productsCategoryName ??
                                                                "")
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      );
                                    }))
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: mData.productList != null &&
                                mData.productList!.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      text:
                                          "${mData.productList!.length.toString()} Found"),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Wrap(
                                      runAlignment: WrapAlignment.spaceBetween,
                                      runSpacing: 12.0,
                                      spacing: 12.0,
                                      children: List.generate(
                                          mData.productList!.length, (index) {
                                        var item = mData.productList![index];

                                        return CatItem(item: item);
                                      })),
                                ],
                              )
                            : const SizedBox.shrink(),
                      )
                    ]),
              );
            }),
            error: ((error, stackTrace) => ErrorView(
                  message: error.toString(),
                  onReload: () {
                    getCatData(isRefreshing: true);
                  },
                )),
            loading: (() => const Center(
                  child: CircularProgressIndicator(),
                )),
          ),
    );
  }
}
