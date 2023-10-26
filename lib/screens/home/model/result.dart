import 'package:equatable/equatable.dart';

import 'banner_list.dart';
import 'popular_products_list.dart';
import 'products_main_category_list.dart';

class HomeData extends Equatable {
  final List<BannerList>? bannerList;
  final List<ProductsMainCategoryList>? productsMainCategoryList;
  final List<PopularProductsList>? popularProductsList;

  const HomeData({
    this.bannerList,
    this.productsMainCategoryList,
    this.popularProductsList,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        bannerList: (json['banner_list'] as List<dynamic>?)
            ?.map((e) => BannerList.fromJson(e as Map<String, dynamic>))
            .toList(),
        productsMainCategoryList: (json['products_main_category_list']
                as List<dynamic>?)
            ?.map((e) =>
                ProductsMainCategoryList.fromJson(e as Map<String, dynamic>))
            .toList(),
        popularProductsList: (json['popular_products_list'] as List<dynamic>?)
            ?.map(
                (e) => PopularProductsList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'banner_list': bannerList?.map((e) => e.toJson()).toList(),
        'products_main_category_list':
            productsMainCategoryList?.map((e) => e.toJson()).toList(),
        'popular_products_list':
            popularProductsList?.map((e) => e.toJson()).toList(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      bannerList,
      productsMainCategoryList,
      popularProductsList,
    ];
  }
}
