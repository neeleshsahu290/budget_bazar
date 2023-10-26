import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/provider/search_screen_notifier.dart';
import 'package:jds_new/screens/product_details/ui/product_details.dart';
import 'package:jds_new/screens/search/model/search_data.dart';
import 'package:jds_new/widget/custom_app_bar.dart';
import 'package:jds_new/widget/custom_image_view.dart';
import 'package:jds_new/widget/custom_search_view.dart';
import 'package:jds_new/widget/empty_view.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final searchScreenProvider =
    ChangeNotifierProvider.autoDispose<SearchScreenNotifier>((ref) {
  return SearchScreenNotifier();
});

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  bool isFirst = true;
  String searchKeyword = "";
  getSearchData({var isRefreshing = false, required String keyword}) async {
    isFirst = false;
    ref
        .read(searchScreenProvider)
        .getSearchData(isRefreshing: isRefreshing, keyword: keyword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Search"),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: CustomSearchView(
                hintText: "Search",
                onChanged: (p0) {},
                onSubmited: (p0) {
                  searchKeyword = p0;
                  getSearchData(keyword: p0, isRefreshing: true);
                },
              ),
            ),
            Expanded(
                child: ref.watch(searchScreenProvider).searchItemsList.when(
                      data: ((data) {
                        List<SearchData> list = data;

                        if (list.isNotEmpty) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(children: [
                              ...List.generate(
                                  list.length,
                                  (index) => SearchItem(
                                        item: list[index],
                                        onClick: () {
                                          navigatorPush(
                                              context,
                                              ProductDetailsScreen(
                                                  name: list[index].name ?? "",
                                                  productId:
                                                      list[index].productsId ??
                                                          0));
                                        },
                                      ))
                            ]),
                          );
                        } else {
                          return const EmptyView(
                            message: "No Items Found",
                          );
                        }
                      }),
                      error: ((error, stackTrace) => ErrorView(
                            message: error.toString(),
                            onReload: () {
                              getSearchData(
                                  keyword: searchKeyword, isRefreshing: true);
                              //    getCartData(isRefreshing: true);
                            },
                          )),
                      loading: (() => isFirst
                          ? const SizedBox.shrink()
                          : const Center(
                              child: CircularProgressIndicator(),
                            )),
                    ))
          ],
        ));
  }
}

class SearchItem extends StatelessWidget {
  final Function()? onClick;
  final SearchData item;
  const SearchItem({super.key, required this.item, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.0),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(8.0),
        elevation: 0.5,
        color: white,
        child: GestureDetector(
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CustomImageView(
                  cornerRadius: 8.0,
                  url: item.photo ?? "",
                  fallBackText: "",
                  height: 20.w,
                  width: 20.w,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyText(
                        text: item.name?.trim() ?? "",
                        fontSize: 15.sp,
                        color: commonTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Row(
                        children: [
                          MyText(
                            textAlignment: TextAlign.start,
                            text: "${item.price} ₹",
                            color: commonTextColorDark,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
