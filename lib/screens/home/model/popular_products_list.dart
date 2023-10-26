import 'package:equatable/equatable.dart';

import 'products_unit_type_list.dart';

// ignore: must_be_immutable
class PopularProductsList extends Equatable {
  final int? productsId;
  final String? name;
  int currentIndex = 0;
  final String? photo;
  final String? description;
//  final int? maxDiscount;
  final List<ProductsUnitTypeList>? productsUnitTypeList;

  PopularProductsList({
    this.productsId,
    this.name,
    this.photo,
    this.description,
    this.currentIndex = 0,
    //   this.maxDiscount,
    this.productsUnitTypeList,
  });

  factory PopularProductsList.fromJson(Map<String, dynamic> json) {
    return PopularProductsList(
      productsId: json['products_id'] as int?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      description: json['description'] as String?,
      // maxDiscount: json['max_discount'] as int?,
      productsUnitTypeList: (json['products_unit_type_list'] as List<dynamic>?)
          ?.map((e) => ProductsUnitTypeList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'products_id': productsId,
        'name': name,
        'photo': photo,
        'description': description,
        // 'max_discount': maxDiscount,
        'products_unit_type_list':
            productsUnitTypeList?.map((e) => e.toJson()).toList(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      productsId,
      name,
      photo,
      description,
      // maxDiscount,
      productsUnitTypeList,
    ];
  }
}
