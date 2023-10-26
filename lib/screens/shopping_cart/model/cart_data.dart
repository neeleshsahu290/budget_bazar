import 'package:equatable/equatable.dart';

import 'cart_item_data.dart';

class CartData extends Equatable {
  final int? deliveryCgst;
  final int? deliverySgst;
  final int? deliveryTax;
  final int? deliveryCharges;
  final int? subtotal;
  final int? tax;
  final int? taxamount;
  final int? totalprice;
  final bool? customerDetailsExists;
  final List<dynamic>? shippingAddress;
  final List<CartItemData>? cartItemData;

  const CartData({
    this.deliveryCgst,
    this.deliverySgst,
    this.deliveryTax,
    this.deliveryCharges,
    this.subtotal,
    this.tax,
    this.taxamount,
    this.totalprice,
    this.customerDetailsExists,
    this.shippingAddress,
    this.cartItemData,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        deliveryCgst: json['delivery_cgst'] as int?,
        deliverySgst: json['delivery_sgst'] as int?,
        deliveryTax: json['delivery_tax'] as int?,
        deliveryCharges: json['delivery_charges'] as int?,
        subtotal: json['subtotal'] as int?,
        tax: json['tax'] as int?,
        taxamount: json['taxamount'] as int?,
        totalprice: json['totalprice'] as int?,
        customerDetailsExists: json['customer_details_exists'] as bool?,
        shippingAddress: json['shipping_address'] as List<dynamic>?,
        cartItemData: (json['cart_data'] as List<dynamic>?)
            ?.map((e) => CartItemData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'delivery_cgst': deliveryCgst,
        'delivery_sgst': deliverySgst,
        'delivery_tax': deliveryTax,
        'delivery_charges': deliveryCharges,
        'subtotal': subtotal,
        'tax': tax,
        'taxamount': taxamount,
        'totalprice': totalprice,
        'customer_details_exists': customerDetailsExists,
        'shipping_address': shippingAddress,
        'cart_data': cartItemData?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      deliveryCgst,
      deliverySgst,
      deliveryTax,
      deliveryCharges,
      subtotal,
      tax,
      taxamount,
      totalprice,
      customerDetailsExists,
      shippingAddress,
      cartItemData,
    ];
  }
}
