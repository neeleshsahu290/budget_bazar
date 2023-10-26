import 'package:equatable/equatable.dart';

class ProductsCategoryList extends Equatable {
  final int? productsCategoryId;
  final String? productsCategoryName;
  final String? productsCategoryPhoto;

  const ProductsCategoryList({
    this.productsCategoryId,
    this.productsCategoryName,
    this.productsCategoryPhoto,
  });

  factory ProductsCategoryList.fromJson(Map<String, dynamic> json) {
    return ProductsCategoryList(
      productsCategoryId: json['products_category_id'] as int?,
      productsCategoryName: json['products_category_name'] as String?,
      productsCategoryPhoto: json['products_category_photo'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'products_category_id': productsCategoryId,
        'products_category_name': productsCategoryName,
        'products_category_photo': productsCategoryPhoto,
      };

  @override
  List<Object?> get props {
    return [
      productsCategoryId,
      productsCategoryName,
      productsCategoryPhoto,
    ];
  }
}
