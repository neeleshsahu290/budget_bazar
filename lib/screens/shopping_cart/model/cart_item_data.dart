import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartItemData extends Equatable {
  final int? productsCartId;
  final String? photo;
  final int? productsId;
  final String? name;
   int? qty ;
  final int? productsUnitTypeId;
  final String? unitTypeName;
  final int? unitTypeDiscount;
  final int? unitTypeMrp;
  final int? yoursavingprice;
  final int? unitTypePrice;
  final bool? isOutOfStock;
  final String? cgst;
  final String? sgst;
  final int? totalGstPercent;
  final int? cgstamount;
  final int? sgstamount;
  final int? totalGstAmount;
  final int? totalPrice;

   CartItemData({
    this.productsCartId,
    this.photo,
    this.productsId,
    this.name,
    this.qty,
    this.productsUnitTypeId,
    this.unitTypeName,
    this.unitTypeDiscount,
    this.unitTypeMrp,
    this.yoursavingprice,
    this.unitTypePrice,
    this.isOutOfStock,
    this.cgst,
    this.sgst,
    this.totalGstPercent,
    this.cgstamount,
    this.sgstamount,
    this.totalGstAmount,
    this.totalPrice,
  });

  factory CartItemData.fromJson(Map<String, dynamic> json) => CartItemData(
        productsCartId: json['products_cart_id'] as int?,
        photo: json['photo'] as String?,
        productsId: json['products_id'] as int?,
        name: json['name'] as String?,
        qty: json['qty'] as int?,
        productsUnitTypeId: json['products_unit_type_id'] as int?,
        unitTypeName: json['unit_type_name'] as String?,
        unitTypeDiscount: json['unit_type_discount'] as int?,
        unitTypeMrp: json['unit_type_mrp'] as int?,
        yoursavingprice: json['yoursavingprice'] as int?,
        unitTypePrice: json['unit_type_price'] as int?,
        isOutOfStock: json['is_out_of_stock'] as bool?,
        cgst: json['cgst'] as String?,
        sgst: json['sgst'] as String?,
        totalGstPercent: json['total_gst_percent'] as int?,
        cgstamount: json['cgstamount'] as int?,
        sgstamount: json['sgstamount'] as int?,
        totalGstAmount: json['total_gst_amount'] as int?,
        totalPrice: json['total_price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'products_cart_id': productsCartId,
        'photo': photo,
        'products_id': productsId,
        'name': name,
        'qty': qty,
        'products_unit_type_id': productsUnitTypeId,
        'unit_type_name': unitTypeName,
        'unit_type_discount': unitTypeDiscount,
        'unit_type_mrp': unitTypeMrp,
        'yoursavingprice': yoursavingprice,
        'unit_type_price': unitTypePrice,
        'is_out_of_stock': isOutOfStock,
        'cgst': cgst,
        'sgst': sgst,
        'total_gst_percent': totalGstPercent,
        'cgstamount': cgstamount,
        'sgstamount': sgstamount,
        'total_gst_amount': totalGstAmount,
        'total_price': totalPrice,
      };

  @override
  List<Object?> get props {
    return [
      productsCartId,
      photo,
      productsId,
      name,
      qty,
      productsUnitTypeId,
      unitTypeName,
      unitTypeDiscount,
      unitTypeMrp,
      yoursavingprice,
      unitTypePrice,
      isOutOfStock,
      cgst,
      sgst,
      totalGstPercent,
      cgstamount,
      sgstamount,
      totalGstAmount,
      totalPrice,
    ];
  }
}
