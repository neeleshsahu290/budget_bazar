import 'package:equatable/equatable.dart';

class ProductsListArr extends Equatable {
  final int? orderDetailsId;
  final String? productPhoto;
  final String? productName;
  final int? productId;
  final String? productQty;
  final String? productPrice;
  final String? totalPrice;
  final bool? isCancellable;
  final int? orderStatusId;
  final String? orderStatusText;

  const ProductsListArr({
    this.orderDetailsId,
    this.productPhoto,
    this.productName,
    this.productId,
    this.productQty,
    this.productPrice,
    this.totalPrice,
    this.isCancellable,
    this.orderStatusId,
    this.orderStatusText,
  });

  factory ProductsListArr.fromJson(Map<String, dynamic> json) {
    return ProductsListArr(
      orderDetailsId: json['order_details_id'] as int?,
      productPhoto: json['product_photo'] as String?,
      productName: json['product_name'] as String?,
      productId: json['product_id'] as int?,
      productQty: json['product_qty'] as String?,
      productPrice: json['product_price'] as String?,
      totalPrice: json['total_price'] as String?,
      isCancellable: json['is_cancellable'] as bool?,
      orderStatusId: json['order_status_id'] as int?,
      orderStatusText: json['order_status_text'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'order_details_id': orderDetailsId,
        'product_photo': productPhoto,
        'product_name': productName,
        'product_id': productId,
        'product_qty': productQty,
        'product_price': productPrice,
        'total_price': totalPrice,
        'is_cancellable': isCancellable,
        'order_status_id': orderStatusId,
        'order_status_text': orderStatusText,
      };

  @override
  List<Object?> get props {
    return [
      orderDetailsId,
      productPhoto,
      productName,
      productId,
      productQty,
      productPrice,
      totalPrice,
      isCancellable,
      orderStatusId,
      orderStatusText,
    ];
  }
}
