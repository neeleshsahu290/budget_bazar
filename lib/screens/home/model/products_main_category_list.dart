import 'package:equatable/equatable.dart';

class ProductsMainCategoryList extends Equatable {
  final int? productsMainCategoryId;
  final int? productsCategoryId;
  final String? name;
  final String? photo;

  const ProductsMainCategoryList({
    this.productsMainCategoryId,
    this.productsCategoryId,
    this.name,
    this.photo,
  });

  factory ProductsMainCategoryList.fromJson(Map<String, dynamic> json) {
    return ProductsMainCategoryList(
      productsMainCategoryId: json['products_main_category_id'] as int?,
      productsCategoryId: json['products_category_id'] as int?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'products_main_category_id': productsMainCategoryId,
        'products_category_id': productsCategoryId,
        'name': name,
        'photo': photo,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      productsMainCategoryId,
      productsCategoryId,
      name,
      photo,
    ];
  }
}
