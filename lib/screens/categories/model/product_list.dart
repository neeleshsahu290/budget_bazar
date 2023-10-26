import 'package:equatable/equatable.dart';
import 'package:jds_new/screens/home/model/products_unit_type_list.dart';

// ignore: must_be_immutable
class ProductList extends Equatable {
  final int? productsId;
  final int? productsCategoryId;
  final String? name;
  final String? photo;
  final String? description;
  final int? cgst;
  final int? sgst;
  final int? qty;
  final int? maxDiscount;
  int currentIndex;
  final List<ProductsUnitTypeList>? productsUnitTypeList;

  ProductList({
    this.productsId,
    this.productsCategoryId,
    this.name,
    this.photo,
    this.description,
    this.cgst,
    this.sgst,
    this.currentIndex = 0,
    this.qty,
    this.maxDiscount,
    this.productsUnitTypeList,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        productsId: json['products_id'] as int?,
        productsCategoryId: json['products_category_id'] as int?,
        name: json['name'] as String?,
        photo: json['photo'] as String?,
        description: json['description'] as String?,
        cgst: json['cgst'] as int?,
        sgst: json['sgst'] as int?,
        qty: json['qty'] as int?,
        maxDiscount: json['max_discount'] as int?,
        productsUnitTypeList: (json['products_unit_type_list']
                as List<dynamic>?)
            ?.map(
                (e) => ProductsUnitTypeList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'products_id': productsId,
        'products_category_id': productsCategoryId,
        'name': name,
        'photo': photo,
        'description': description,
        'cgst': cgst,
        'sgst': sgst,
        'qty': qty,
        'max_discount': maxDiscount,
        'products_unit_type_list':
            productsUnitTypeList?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      productsId,
      productsCategoryId,
      name,
      photo,
      description,
      cgst,
      sgst,
      qty,
      maxDiscount,
      productsUnitTypeList,
    ];
  }
}
