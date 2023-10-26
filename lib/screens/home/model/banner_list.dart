import 'package:equatable/equatable.dart';

class BannerList extends Equatable {
  final int? homepageTopBannerId;
  final int? productId;
  final String? photo;
  final int? typeval;
  final String? typename;
  final String? productsMainCategoryId;
  final String? productsCategoryId;

  const BannerList({
    this.homepageTopBannerId,
    this.productId,
    this.photo,
    this.typeval,
    this.typename,
    this.productsMainCategoryId,
    this.productsCategoryId,
  });

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        homepageTopBannerId: json['homepage_top_banner_id'] as int?,
        productId: json['product_id'] as int?,
        photo: json['photo'] as String?,
        typeval: json['typeval'] as int?,
        typename: json['typename'] as String?,
        productsMainCategoryId: json['products_main_category_id'] as String?,
        productsCategoryId: json['products_category_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'homepage_top_banner_id': homepageTopBannerId,
        'product_id': productId,
        'photo': photo,
        'typeval': typeval,
        'typename': typename,
        'products_main_category_id': productsMainCategoryId,
        'products_category_id': productsCategoryId,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      homepageTopBannerId,
      productId,
      photo,
      typeval,
      typename,
      productsMainCategoryId,
      productsCategoryId,
    ];
  }
}
