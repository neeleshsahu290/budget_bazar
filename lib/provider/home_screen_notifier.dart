import 'dart:developer';

import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/provider/base_notifier.dart';
import 'package:jds_new/repository/base_repository.dart';
import 'package:jds_new/screens/home/model/banner_list.dart';
import 'package:jds_new/screens/home/model/popular_products_list.dart';
import 'package:jds_new/screens/home/model/products_main_category_list.dart';
import 'package:jds_new/screens/home/model/result.dart';

class HomeScreenNotifier extends BaseNotifier {
  List<BannerList> bannerList = [
    const BannerList(),
  ];
  List<ProductsMainCategoryList> productsMainCategoryList = [];
  List<PopularProductsList> popularProductsList = [];

  DataState homePageState = DataState.loading;

  final Repository _repository = Repository();

  changeProductSelect(int index, int value) {
    popularProductsList[index].currentIndex = value;
    notifyListeners();
  }

  getHomeData({
    isRefreshing = false,
  }) async {
    if (isRefreshing) {
      homePageState = DataState.loading;
      notifyListeners();
    }
    final response = await _repository.getHomePage();
    if (response['status'] == success) {
      // Home home = response['data'];
      List<HomeData> list = response['data'] ?? [];
      if (list.isNotEmpty) {
        homePageState = DataState.data;

        var data = list[0];
        bannerList = data.bannerList ?? [];

        log(bannerList.length.toString());
        productsMainCategoryList = data.productsMainCategoryList ?? [];
        log(productsMainCategoryList.length.toString());

        popularProductsList = data.popularProductsList ?? [];
      } else {
        log(response['data'].toString());
      }
    } else {
      log(response['error'].toString());
    }
    notifyListeners();
  }
}

enum DataState { loading, error, data, noData }
