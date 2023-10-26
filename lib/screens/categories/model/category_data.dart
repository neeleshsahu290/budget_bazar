import 'package:equatable/equatable.dart';

import 'get_search_autocompletion_list_for_products_list.dart';
import 'product_list.dart';
import 'products_category_list.dart';

class CategoryData extends Equatable {
  final int? productsMainCategoryId;
  final int? productsCategoryId;
  final String? productsMainCategoryName;
  final List<ProductsCategoryList>? productsCategoryList;
  final List<GetSearchAutocompletionListForProductsList>?
      getSearchAutocompletionListForProductsList;
  final List<ProductList>? productList;

  const CategoryData({
    this.productsMainCategoryId,
    this.productsCategoryId,
    this.productsMainCategoryName,
    this.productsCategoryList,
    this.getSearchAutocompletionListForProductsList,
    this.productList,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        productsMainCategoryId: json['products_main_category_id'] as int?,
        productsCategoryId: json['products_category_id'] as int?,
        productsMainCategoryName:
            json['products_main_category_name'] as String?,
        productsCategoryList: (json['products_category_list'] as List<dynamic>?)
            ?.map(
                (e) => ProductsCategoryList.fromJson(e as Map<String, dynamic>))
            .toList(),
        getSearchAutocompletionListForProductsList:
            (json['get_search_autocompletion_list_for_products_list']
                    as List<dynamic>?)
                ?.map((e) =>
                    GetSearchAutocompletionListForProductsList.fromJson(
                        e as Map<String, dynamic>))
                .toList(),
        productList: (json['product_list'] as List<dynamic>?)
            ?.map((e) => ProductList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'products_main_category_id': productsMainCategoryId,
        'products_category_id': productsCategoryId,
        'products_main_category_name': productsMainCategoryName,
        'products_category_list':
            productsCategoryList?.map((e) => e.toJson()).toList(),
        'get_search_autocompletion_list_for_products_list':
            getSearchAutocompletionListForProductsList
                ?.map((e) => e.toJson())
                .toList(),
        'product_list': productList?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      productsMainCategoryId,
      productsCategoryId,
      productsMainCategoryName,
      productsCategoryList,
      getSearchAutocompletionListForProductsList,
      productList,
    ];
  }
}
