// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../home/model/products_unit_type_list.dart';
import 'slider_gallery.dart';

class ProductData extends Equatable {
  final int? productsId;
  final String? productsMainCategoryName;
  final int? productsCategoryId;
  final String? productsCategoryName;
  final List<SliderGallery>? sliderGallery;
  final String? name;
  final String? photo;
  final String? description;
  final int? maxDiscount;
  // int currentIndex = 0;
  final List<ProductsUnitTypeList>? productsUnitTypeList;

  const ProductData({
    this.productsId,
    this.productsMainCategoryName,
    this.productsCategoryId,
    this.productsCategoryName,
    this.sliderGallery,
    // this.currentIndex = 0,
    this.name,
    this.photo,
    this.description,
    this.maxDiscount,
    this.productsUnitTypeList,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        productsId: json['products_id'] as int?,
        productsMainCategoryName:
            json['products_main_category_name'] as String?,
        productsCategoryId: json['products_category_id'] as int?,
        productsCategoryName: json['products_category_name'] as String?,
        sliderGallery: (json['slider_gallery'] as List<dynamic>?)
            ?.map((e) => SliderGallery.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] as String?,
        photo: json['photo'] as String?,
        description: json['description'] as String?,
        maxDiscount: json['max_discount'] as int?,
        productsUnitTypeList: (json['products_unit_type_list']
                as List<dynamic>?)
            ?.map(
                (e) => ProductsUnitTypeList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'products_id': productsId,
        'products_main_category_name': productsMainCategoryName,
        'products_category_id': productsCategoryId,
        'products_category_name': productsCategoryName,
        'slider_gallery': sliderGallery?.map((e) => e.toJson()).toList(),
        'name': name,
        'photo': photo,
        'description': description,
        'max_discount': maxDiscount,
        'products_unit_type_list':
            productsUnitTypeList?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      productsId,
      productsMainCategoryName,
      productsCategoryId,
      productsCategoryName,
      sliderGallery,
      name,
      photo,
      description,
      maxDiscount,
      productsUnitTypeList,
    ];
  }
}
