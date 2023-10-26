// import 'package:equatable/equatable.dart';

// class ProductsUnitTypeList extends Equatable {
//   final int? productsUnitTypeId;
//   final String? unitTypeName;
//   final int? unitTypeDiscount;
//   final int? unitTypeMrp;
//   final int? unitTypePrice;
//   final int? yoursavingprice;
//   final int? unitTypeQty;
//   final bool? isOutOfStock;

//   const ProductsUnitTypeList({
//     this.productsUnitTypeId,
//     this.unitTypeName,
//     this.unitTypeDiscount,
//     this.unitTypeMrp,
//     this.unitTypePrice,
//     this.yoursavingprice,
//     this.unitTypeQty,
//     this.isOutOfStock,
//   });

//   factory ProductsUnitTypeList.fromJson(Map<String, dynamic> json) {
//     return ProductsUnitTypeList(
//       productsUnitTypeId: json['products_unit_type_id'] as int?,
//       unitTypeName: json['unit_type_name'] as String?,
//       unitTypeDiscount: json['unit_type_discount'] as int?,
//       unitTypeMrp: json['unit_type_mrp'] as int?,
//       unitTypePrice: json['unit_type_price'] as int?,
//       yoursavingprice: json['yoursavingprice'] as int?,
//       unitTypeQty: json['unit_type_qty'] as int?,
//       isOutOfStock: json['is_out_of_stock'] as bool?,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'products_unit_type_id': productsUnitTypeId,
//         'unit_type_name': unitTypeName,
//         'unit_type_discount': unitTypeDiscount,
//         'unit_type_mrp': unitTypeMrp,
//         'unit_type_price': unitTypePrice,
//         'yoursavingprice': yoursavingprice,
//         'unit_type_qty': unitTypeQty,
//         'is_out_of_stock': isOutOfStock,
//       };

//   @override
//   List<Object?> get props {
//     return [
//       productsUnitTypeId,
//       unitTypeName,
//       unitTypeDiscount,
//       unitTypeMrp,
//       unitTypePrice,
//       yoursavingprice,
//       unitTypeQty,
//       isOutOfStock,
//     ];
//   }
// }
