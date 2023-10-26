import 'package:equatable/equatable.dart';

import 'products_list_arr.dart';

class OrderModelData extends Equatable {
  final int? orderId;
  final String? orderNo;
  final String? orderDate;
  final String? createdDate;
  final int? taxPercent;
  final int? taxAmount;
  final int? deliveryCharges;
  final int? subtotal;
  final int? total;
  final String? paymentMode;
  final List<ProductsListArr>? productsListArr;
  final String? customerShippingAddress;
  final String? customerMobileno;

  const OrderModelData({
    this.orderId,
    this.orderNo,
    this.orderDate,
    this.createdDate,
    this.taxPercent,
    this.taxAmount,
    this.deliveryCharges,
    this.subtotal,
    this.total,
    this.paymentMode,
    this.productsListArr,
    this.customerShippingAddress,
    this.customerMobileno,
  });

  factory OrderModelData.fromJson(Map<String, dynamic> json) => OrderModelData(
        orderId: json['order_id'] as int?,
        orderNo: json['order_no'] as String?,
        orderDate: json['order_date'] as String?,
        createdDate: json['created_date'] as String?,
        taxPercent: json['tax_percent'] as int?,
        taxAmount: json['tax_amount'] as int?,
        deliveryCharges: json['delivery_charges'] as int?,
        subtotal: json['subtotal'] as int?,
        total: json['total'] as int?,
        paymentMode: json['payment_mode'] as String?,
        productsListArr: (json['products_list_arr'] as List<dynamic>?)
            ?.map((e) => ProductsListArr.fromJson(e as Map<String, dynamic>))
            .toList(),
        customerShippingAddress: json['customer_shipping_address'] as String?,
        customerMobileno: json['customer_mobileno'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'order_no': orderNo,
        'order_date': orderDate,
        'created_date': createdDate,
        'tax_percent': taxPercent,
        'tax_amount': taxAmount,
        'delivery_charges': deliveryCharges,
        'subtotal': subtotal,
        'total': total,
        'payment_mode': paymentMode,
        'products_list_arr': productsListArr?.map((e) => e.toJson()).toList(),
        'customer_shipping_address': customerShippingAddress,
        'customer_mobileno': customerMobileno,
      };

  @override
  List<Object?> get props {
    return [
      orderId,
      orderNo,
      orderDate,
      createdDate,
      taxPercent,
      taxAmount,
      deliveryCharges,
      subtotal,
      total,
      paymentMode,
      productsListArr,
      customerShippingAddress,
      customerMobileno,
    ];
  }
}
